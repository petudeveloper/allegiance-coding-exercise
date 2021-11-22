class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @requests = current_user.requests.all
  end

  def new
    @request = Request.new
  end

  def create
    @user = current_user
    @request = current_user.requests.new(create_request_params)
    if @request.save
      TechRequestMailer.with(user: @user, request: @request).request_sent.deliver_later
      redirect_to requests_path, notice: 'Post was successfully created.'
    else
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def create_request_params
    params.require(:request).permit(:subject, :body)
  end
end

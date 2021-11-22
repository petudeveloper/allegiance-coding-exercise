class Request < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
end

require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'arguments validation ' do
    it 'rejects empty subject' do
      user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
      request1 = Request.new(subject: '', body: 'test', user_id: user1.id)
      expect(request1.valid?).to eq(false)
    end

    it 'rejects empty body' do
      user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
      request1 = Request.new(subject: 'test', body: '', user_id: user1.id)
      expect(request1.valid?).to eq(false)
    end

    it 'validates body and names' do
      user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
      request1 = Request.new(subject: 'test', body: 'test', user_id: user1.id)
      expect(request1.valid?).to eq(true)
    end

    it 'rejects without user association' do
      request1 = Request.new(subject: 'test', body: 'test')
      expect(request1.valid?).to eq(false)
    end
  end

  it 'deletes a request' do
    user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
    request1 = Request.create!(subject: 'test', body: 'test', user_id: user1.id)
    request1.delete
    expect(Request.all.count).to eq(0)
  end

  context 'as a collection for User model' do
    describe 'checks request arguments validations' do
      it 'rejects empty subject' do
        user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
        request1 = user1.requests.build(subject: '', body: 'test')
        expect(request1.valid?).to eq(false)
      end

      it 'rejects empty body' do
        user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
        request1 = user1.requests.build(subject: 'test', body: '')
        expect(request1.valid?).to eq(false)
      end

      it 'validates body and names' do
        user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
        request1 = user1.requests.new(subject: 'test', body: 'test')
        expect(request1.valid?).to eq(true)
      end
    end

    it 'accesses all the requests associated to a user' do
      user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
      user1.requests.create(subject: 'test1', body: 'test1')
      user1.requests.create(subject: 'test2', body: 'test2')
      expect(user1.requests.count).to eq(2)
    end
  end
end

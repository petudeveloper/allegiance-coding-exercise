require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Checks user validations' do
    it 'rejects empty name' do
      user1 = User.new(name: '')
      expect(user1.valid?).to eq(false)
    end

    it 'validates user name' do
      user1 = User.new(email: 'user1@email.com', name: 'user1', password: '123456')
      expect(user1.valid?).to eq(true)
    end

    it 'sets the admin field to false by default' do
      user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
      expect(user1.admin?).to eq(false)
    end
  end

  it 'deletes a user' do
    user1 = User.create(email: 'user1@email.com', name: 'user2', password: '123456')
    user1.delete
    expect(User.all.count).to eq(0)
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  #Devise
  it 'is database authenticable' do
    user = AdminUser.create(
      email: 'admin@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

  #validations
  it { is_expected.to validate_presence_of(:name) }
end
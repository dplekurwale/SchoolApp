require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  subject { AdminUser.new(email: 'admin@sample.com', password: 'password' )}
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid with invalid attributes' do
    subject.email = 'email'
    expect(subject).to_not be_valid
  end

  #validations
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  #Devise
  it 'is database authenticable' do
    user = AdminUser.create(
      email: 'admin@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

  #associations
  it { should have_and_belong_to_many(:roles) }
  it { should have_many(:schools) }
  it { should have_many(:courses).through(:schools) }
  it { should have_many(:batches).through(:courses) }
  it { should have_many(:students).through(:batches) }
end

require 'rails_helper'

RSpec.describe School, type: :model do
  #associations
  it { should have_many(:batches) }
  it { should belong_to(:admin_user).optional }
  it { should have_many(:users) }
  it { should have_many(:courses) }
  
  #validations
  it { is_expected.to validate_presence_of(:name) }
end

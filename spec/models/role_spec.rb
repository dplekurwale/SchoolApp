require 'rails_helper'

RSpec.describe Role, type: :model do
  #associations
  it { should have_and_belong_to_many(:admin_users) }
  it { should belong_to(:resource).optional }
  
  #validations
  it { should validate_inclusion_of(:resource_type).in_array(Rolify.resource_types) }
  it { is_expected.to validate_presence_of(:name) }
end

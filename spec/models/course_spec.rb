require 'rails_helper'

RSpec.describe Course, type: :model do
  #associations
  it { should belong_to(:school).optional }
  it { should belong_to(:admin_user).optional }
  it { should have_many(:batches) }

  #validations
  it { is_expected.to validate_presence_of(:name) }
end

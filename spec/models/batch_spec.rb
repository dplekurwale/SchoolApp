require 'rails_helper'

RSpec.describe Batch, type: :model do
  #associations
  it { should belong_to(:course).optional }
  it { should belong_to(:school).optional }
  it { should belong_to(:admin_user).optional }
  it { should have_many(:student_batches) }
  it { should have_many(:students).through(:student_batches) }

  #validations
  it { is_expected.to validate_presence_of(:name) }
end

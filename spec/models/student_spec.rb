require 'rails_helper'

RSpec.describe Student, type: :model do
  #associations
  it { should belong_to(:school).optional }
  it { should have_many(:student_batches) }
  it { should have_many(:batches).through(:student_batches) }
end

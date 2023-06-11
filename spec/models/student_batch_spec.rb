require 'rails_helper'

RSpec.describe StudentBatch, type: :model do
  #enum for status
  it { should define_enum_for(:status) }

  #associations
  it { should belong_to(:user) }
  it { should belong_to(:student).with_foreign_key(:user_id).optional.class_name('User') }
  it { should belong_to(:batch) }

  #validations
  it { should validate_uniqueness_of(:user_id).scoped_to(:batch_id) }

  #class methods
  describe '.get_status(batch_id, student_id)' do
    it 'should return status' do
      school = create(:school)
      student = create(:student, school_id: school.id)
      course = create(:course)
      batch = create(:batch)
      student_batch = create(:student_batch, user_id: student.id, batch_id: batch.id)
      expect(StudentBatch.get_status(batch.id, student.id)).to eq('pending')
    end
  end
end

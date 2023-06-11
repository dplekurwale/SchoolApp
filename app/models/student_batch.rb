class StudentBatch < ApplicationRecord
  enum :status, [ :pending, :requested, :approved, :rejected ]

  belongs_to :user
  belongs_to :student, foreign_key: 'user_id', optional: true, class_name: 'User'
  belongs_to :batch

  validates :user_id, uniqueness: { scope: :batch_id }

  def self.get_status(batch_id, student_id)
    student_batch = find_by(batch_id: batch_id, user_id: student_id)
    student_batch&.status
  end
end

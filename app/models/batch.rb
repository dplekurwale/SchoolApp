class Batch < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :school, optional: true
  belongs_to :admin_user, optional: true, foreign_key: :course_id
  has_many :student_batches, foreign_key: :batch_id
  has_many :students, through: :student_batches, source: :user

  validates :name, presence: true
end
class Student < User
  belongs_to :school, optional: true
  has_many :student_batches, foreign_key: :user_id
  has_many :batches, through: :student_batches, class_name: 'StudentBatch'

  validates :school_id, presence: true
end

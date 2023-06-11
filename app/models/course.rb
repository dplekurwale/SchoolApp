class Course < ApplicationRecord
  belongs_to :school, optional: true
  belongs_to :admin_user, optional: true, foreign_key: :school_id
  has_many :batches

  validates :name, presence: true
end

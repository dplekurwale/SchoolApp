class School < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :courses
  has_many :batches
  belongs_to :admin_user, class_name: 'AdminUser', optional: true, foreign_key: :created_by_admin_user_id, primary_key: :id
end
class AdminUser < ApplicationRecord
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles, join_table: :admin_users_roles
  has_many :schools, foreign_key: :created_by_admin_user_id
  has_many :courses, through: :schools, class_name: 'Course', foreign_key: :school_id
  has_many :batches, through: :courses, class_name: 'Batch', foreign_key: :course_id
  has_many :students, through: :batches, class_name: 'User', foreign_key: :user_id
end

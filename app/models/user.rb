class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :rememberable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
end

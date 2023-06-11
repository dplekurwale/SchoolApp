FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) { |n| "user-#{n}@example.com" }
    password 'password'
  end

  factory :student do
    sequence(:name) { |n| "student-#{n}" }
    sequence(:email) { |n| "student-#{n}@example.com" }
    password 'password'
  end

  factory :admin_user do
    sequence(:email) { |n| "admin_user-#{n}@example.com" }
    password 'password'
    after(:create) do |user|      
      user.add_role(:admin)
    end
  end

  factory :school_admin, class: AdminUser do
    sequence(:email) { |n| "school-admin-#{n}@example.com" }
    password 'password'
    after(:create) do |user|      
      user.add_role(:school_admin)
    end
  end

  factory :school do
    sequence(:name) { |n| "School-#{n}" }
    address 'School Address'
  end

  factory :course do
    sequence(:name) { |n| "Course-#{n}" }
  end

  factory :batch do
    sequence(:name) { |n| "Batch-#{n}" }
  end

  factory :student_batch do

  end

  factory :role do

  end

end
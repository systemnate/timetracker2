FactoryGirl.define do
  factory :user do
    name 'Nate'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'password'
    role_id 1
  end
end

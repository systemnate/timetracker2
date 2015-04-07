FactoryGirl.define do
  factory :user do
    name 'Nate'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'password'
  end
end
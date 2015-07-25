FactoryGirl.define do
  factory :task do
    title "Test Title"
    association :status, factory: :status
    association :product, factory: :product
    association :priority, factory: :priority
    association :client, factory: :client
    assigned_to 1
  end
end

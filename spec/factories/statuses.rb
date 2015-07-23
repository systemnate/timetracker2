FactoryGirl.define do
  factory :status do
    name "Open"
    color
  end

  factory :status_closed do
    name "Closed"
    color
  end
end

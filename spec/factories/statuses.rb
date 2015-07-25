FactoryGirl.define do
  factory :status do
    name "Open"
    color
    is_complete false
    default_view true
  end

  factory :status_closed, class: Status do
    name "Closed"
    color
    is_complete true
    default_view false
  end
end

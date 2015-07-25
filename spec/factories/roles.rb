FactoryGirl.define do
  factory :role do
    name "MyString"
  end
  factory :role_admin, class: Role do
    name "Administrator"
  end
  factory :role_regular, class: Role do
    name "Regular"
  end
  factory :role_viewer, class: Role do
    name "Viewer"
  end
end

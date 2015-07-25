FactoryGirl.define do
  factory :project do
    title 'New Project'
    client
    user_id 1
    allotted_time 1
    time_spent 1
    due_date 2.weeks.from_now
  end
end

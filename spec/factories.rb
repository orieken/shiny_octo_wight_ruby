FactoryGirl.define do
  factory :release do
    sequence(:release_number)
    release_date  { Date.today.strftime('%D')}
  end
end
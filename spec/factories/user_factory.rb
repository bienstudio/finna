FactoryGirl.define do
  sequence :email do |n|
    "bill#{n}@space.org"
  end

  factory :user do
    name 'Bill Nye'
    email
  end
end

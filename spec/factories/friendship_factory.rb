FactoryGirl.define do
  factory :friendship do
    user_id   { UserRepository.create(build(:user)).id }
    friend_id { UserRepository.create(build(:user)).id }
  end
end

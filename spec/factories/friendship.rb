FactoryBot.define do
  factory :friendship do
    user factory: :user
    friend factory: :user

    status { false }
  end
end

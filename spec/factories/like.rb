FactoryBot.define do
  factory :like do
    user factory: :user
    post factory: :post
  end
end

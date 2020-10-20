FactoryBot.define do
  factory :comment do
    user factory: :user
    post factory: :post

    content { 'My Comment' }
  end
end

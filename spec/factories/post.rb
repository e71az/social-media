FactoryBot.define do
  factory :post do
    user factory: :user

    content { 'Random Post Content' }
  end
end

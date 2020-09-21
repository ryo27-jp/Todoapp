FactoryBot.define do
  factory :user do
      name      {"Aaron"}
      sequence(:email) { |n| "test#{n}@example.com"}
      password {"password"}
  end
end

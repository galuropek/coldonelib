FactoryBot.define do
  factory :beer do
    title { "MyString" }
    brand { "MyString" }
    name { "MyString" }
    description { "MyText" }

    trait :invalid do
      title { nil }
    end
  end
end

FactoryBot.define do
  factory :comment do
    nickname { Faker::FunnyName.name }
    content { Faker::Quote.famous_last_words }

    association :book
  end
end

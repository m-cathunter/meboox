FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    publication_date { Faker::Date.between(from: 15.years.ago, to: 1.month.ago) }

    association :author
  end

  factory :audio_book, parent: :book, class: 'AudioBook' do
    duration { Random.rand(1..120) }
  end
end

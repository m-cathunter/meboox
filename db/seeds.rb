require 'faker'

# Prepare authors
authors = 50.times.map do
  {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    created_at: Time.current,
    updated_at: Time.current
  }
end
Author.insert_all(authors)

# Prepare books
author_ids = Author.ids
books = 150.times.map do |x|
  {
    type: x.even? ? 'Book' : 'AudioBook',
    title: Faker::Book.title,
    author_id: author_ids.sample,
    publication_date: Faker::Date.between(from: 15.years.ago, to: 1.month.ago),
    duration: x.even? ? nil : Random.rand(1..120),
    created_at: Time.current,
    updated_at: Time.current
  }
end
Book.insert_all(books)

# Prepare comments
book_ids = Book.ids
comments = 1000.times.map do
  {
    book_id: book_ids.sample,
    nickname: Faker::FunnyName.name,
    content: Faker::Quote.famous_last_words,
    created_at: Time.current,
    updated_at: Time.current
  }
end
Comment.insert_all(comments)

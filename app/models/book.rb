class Book < ApplicationRecord
  belongs_to :author
  has_many :comments

  validates :title, presence: true
  validates :publication_date, presence: true

  def suggestions
    authors_books = Book.limit(3).joins(:comments).
      group('books.id').where(author_id: author_id).order('avg(comments.stars) desc')

    if (length = authors_books.length) < 3
      missing_records = 3 - length
      all_books = Book.limit(missing_records).joins(:comments).group('books.id').order('avg(comments.stars) desc')
    else
      all_books = []
    end

    authors_books + all_books
  end
end

# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  duration         :integer
#  publication_date :date
#  title            :string
#  type             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer          not null
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#

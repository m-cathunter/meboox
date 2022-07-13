class Book < ApplicationRecord
  belongs_to :author
  has_many :comments

  validates :title, presence: true
  validates :publication_date, presence: true
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

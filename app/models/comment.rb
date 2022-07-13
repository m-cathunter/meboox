class Comment < ApplicationRecord
  belongs_to :book

  validates :nickname, presence: true, uniqueness: true
  validates :content, presence: true
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer          not null
#
# Indexes
#
#  index_comments_on_book_id  (book_id)
#
# Foreign Keys
#
#  book_id  (book_id => books.id)
#

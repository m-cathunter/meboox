class BookSerializer < ActiveModel::Serializer
  belongs_to :author

  attribute :id
  attribute :title
  attribute :publication_date
  attribute :type
  attribute :duration, if: :audiobook?

  def audiobook?
    object.is_a? AudioBook
  end
end

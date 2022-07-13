class BookSerializer < ActiveModel::Serializer
  belongs_to :author

  attribute :id
  attribute :title
  attribute :publication_date
end

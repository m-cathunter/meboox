class AuthorSerializer < ActiveModel::Serializer
  attribute :id
  attribute :first_name
  attribute :last_name
  attribute :full_name
end

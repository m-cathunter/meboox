class CommentSerializer < ActiveModel::Serializer
  attribute :id
  attribute :nickname
  attribute :content
  attribute :stars
end

class CommentSerializer < ActiveModel::Serializer
  attribute :id
  attribute :nickname
  attribute :content
end

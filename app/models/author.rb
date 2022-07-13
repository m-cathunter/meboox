class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end
end

# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

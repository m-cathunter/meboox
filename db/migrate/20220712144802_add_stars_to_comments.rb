class AddStarsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :stars, :integer
  end
end

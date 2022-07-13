class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :nickname
      t.belongs_to :book, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

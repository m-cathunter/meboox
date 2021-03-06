class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.belongs_to :author, null: false, foreign_key: true
      t.date :publication_date

      t.timestamps
    end
  end
end

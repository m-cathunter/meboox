class AddDurationToAudioBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :duration, :integer
  end
end

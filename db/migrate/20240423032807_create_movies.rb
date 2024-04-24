class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :memo
      t.integer :theater_id, null: false
      t.integer :expense, null: false
      t.datetime :start_time, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

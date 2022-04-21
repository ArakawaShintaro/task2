class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :book_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :favorites, [:user_id, :book_id], unique: true
  end
end

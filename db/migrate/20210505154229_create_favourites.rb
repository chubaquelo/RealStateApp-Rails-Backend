class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :property_id

      t.timestamps
    end
    add_index :favourites, [:user_id, :property_id], unique: true
  end
end

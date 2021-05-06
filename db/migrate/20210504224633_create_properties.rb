class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title, unique: true
      t.string :desc
      t.decimal :price
      t.integer :bedrooms
      t.integer :baths
      t.integer :sqrmeters
      t.string :address, unique: true
      t.string :img_url

      t.timestamps
    end
  end
end

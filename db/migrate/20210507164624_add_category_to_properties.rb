class AddCategoryToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :category, :string
  end
end

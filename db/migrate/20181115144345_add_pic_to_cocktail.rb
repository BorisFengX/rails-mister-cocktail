class AddPicToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :pic, :string
  end
end

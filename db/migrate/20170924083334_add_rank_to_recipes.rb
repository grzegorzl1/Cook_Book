class AddRankToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :rank, :integer, default: 0, null: false
  end
end

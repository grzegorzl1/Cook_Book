class RemoveLikeFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :like
  end
end

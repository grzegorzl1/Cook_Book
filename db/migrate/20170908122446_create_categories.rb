class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :recipes, :categories
    add_foreign_key :recipes_categories, :recipes
    add_foreign_key :recipes_categories, :categories
  end
end

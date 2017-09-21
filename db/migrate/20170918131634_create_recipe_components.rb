class CreateRecipeComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_components do |t|
      t.integer :recipe_id
      t.integer :component_id

      t.references :recipe, foreign_key: true
      t.references :component, foreign_key: true
      
      t.timestamps
    end
  end
end

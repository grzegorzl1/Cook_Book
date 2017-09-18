class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :difficulty_level
      t.integer :like
      t.integer :like
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

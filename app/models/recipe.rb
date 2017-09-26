class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :difficulty_level, presence: true
  validates :rank, numericality: { only_integer: true }
  validates :name, uniqueness: true

  has_many :recipe_components, dependent: :destroy
  has_many :components, through: :recipe_components
  belongs_to :category


  def next_recipe
    Recipe.where("id > ?", id).order(:id).first
  end

  def previous_recipe
    Recipe.where("id < ?", id).order(:id).last
  end

  def capitalize_name
    self.name = self.name.capitalize
    self.save!
  end

  def self.search(q)
    Recipe.where("name like :query or description like :query", query: "%#{q}%")
  end
end

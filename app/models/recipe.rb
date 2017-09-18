class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :difficulty_level, presence: true
  validates :rank, numericality: { only_integer: true }

  has_many :component, dependent: :destroy
  belongs_to :categories


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
    Recipe.where("title like :query or text like :query", query: "%#{q}%")
  end
end

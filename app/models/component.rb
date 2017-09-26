class Component < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: true 

  has_many :recipe_components

  def capitalize_name
    self.name = self.name.capitalize
    self.save!
  end
end

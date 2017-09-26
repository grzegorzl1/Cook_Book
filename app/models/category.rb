class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :name, uniqueness: true 

  has_many :recipes

  def capitalize_name
    self.name = self.name.capitalize
    self.save!
  end
end

class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }

  has_many :recipe

  def capitalize_name
    self.name = self.name.capitalize
    self.save!
  end
end

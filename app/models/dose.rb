class Dose < ApplicationRecord
  validates :description, presence: true
  validates :ingredient_id, :uniqueness => {:scope => :cocktail_id }
  # validates :cocktail_id, :ingredient_id, uniqueness: true
  belongs_to :cocktail
  belongs_to :ingredient
end

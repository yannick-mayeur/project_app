class Course < ApplicationRecord
  has_many :followments
  has_many :users, through: :followments

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
end

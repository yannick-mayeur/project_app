class Course < ApplicationRecord
  has_many :followments
  has_many :users, through: :followments
end

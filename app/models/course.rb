class Course < ApplicationRecord
  has_many :followments
  has_many :users, through: :followments
  has_many :old_exams

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }

  def Course.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end

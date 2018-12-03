class Course < ApplicationRecord
  has_many :followments, dependent: :destroy
  has_many :dusers, through: :followments
  has_many :old_exams, dependent: :destroy

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

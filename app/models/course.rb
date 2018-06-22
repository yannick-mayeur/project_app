class Course < ApplicationRecord
  has_many :followments
  has_many :users, through: :followments
  has_many :old_exams
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :group_id, presence: true

  def Course.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def Course.filter(filter)
    if filter
      where('group_id = ?', filter[:group_id])
    else
      all
    end
  end
    
end

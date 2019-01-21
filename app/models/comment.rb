class Comment < ApplicationRecord
  has_one_attached :image
  belongs_to :duser
  belongs_to :old_exam

  validates :content, presence: true, length: { maximum: 255 }
  validate :image?


  private

  def image?
    if image.attached? && !image.content_type.in?(%w(image/jpeg))
      errors.add(:document, 'Must be a jpg image')
    end
  end
end

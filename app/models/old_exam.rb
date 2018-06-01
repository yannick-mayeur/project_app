class OldExam < ApplicationRecord
  has_one_attached :file
  belongs_to :course
  has_many :comments
  validates :title, presence: true, length: { maximum: 50 }
  validate :file?


  private

  def file?
    errors.add(:base, 'Please upload exam pdf') unless file.attached?
    if file.attached? && !file.content_type.in?(%w(application/pdf))
      errors.add(:document, 'Must be a PDF file')
    end
  end
end

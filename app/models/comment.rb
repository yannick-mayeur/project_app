class Comment < ApplicationRecord
  belongs_to :duser
  belongs_to :old_exam

  validates :content, presence: true, length: { maximum: 255 }
end

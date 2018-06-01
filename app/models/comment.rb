class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :old_exam
end

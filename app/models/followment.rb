class Followment < ApplicationRecord
  belongs_to :duser
  belongs_to :course
end

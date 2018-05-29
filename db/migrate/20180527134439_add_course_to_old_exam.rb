class AddCourseToOldExam < ActiveRecord::Migration[5.2]
  def change
    add_reference :old_exams, :course, foreign_key: true
  end
end

class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.integer :course_id
      t.string :file
      t.date :date

      t.timestamps
    end
  end
end

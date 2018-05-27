class CreateOldExams < ActiveRecord::Migration[5.2]
  def change
    create_table :old_exams do |t|
      t.string :title

      t.timestamps
    end
  end
end

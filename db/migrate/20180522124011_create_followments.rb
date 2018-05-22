class CreateFollowments < ActiveRecord::Migration[5.2]
  def change
    create_table :followments do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end

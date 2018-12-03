class AddDuserToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :duser_id, :integer
    add_index :comments, :duser_id
  end
end

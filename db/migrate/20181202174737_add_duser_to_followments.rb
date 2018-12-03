class AddDuserToFollowments < ActiveRecord::Migration[5.2]
  def change
    add_column :followments, :duser_id, :integer
  end
end

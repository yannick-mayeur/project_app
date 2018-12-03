class RemoveUserFromFollowments < ActiveRecord::Migration[5.2]
  def change
    remove_column :followments, :user_id, :integer
  end
end

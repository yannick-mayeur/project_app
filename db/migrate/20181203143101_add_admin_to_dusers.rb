class AddAdminToDusers < ActiveRecord::Migration[5.2]
  def change
    add_column :dusers, :admin, :boolean
  end
end

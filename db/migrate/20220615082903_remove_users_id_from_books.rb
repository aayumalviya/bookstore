class RemoveUsersIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :users_id, :integer
  end
end

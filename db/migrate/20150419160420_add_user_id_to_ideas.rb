class AddUserIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :user_id, :integer
    add_column :ideas, :taken_up_id, :integer
  end
end

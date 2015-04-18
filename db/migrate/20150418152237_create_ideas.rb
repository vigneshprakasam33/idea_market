class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.text :skills
      t.text :additional_info
      t.integer :platform_id
      t.integer :role_id

      t.timestamps
    end
  end
end

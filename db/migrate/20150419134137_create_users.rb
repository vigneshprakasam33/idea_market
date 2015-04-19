class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.uuid :uuid
      t.string :uname
      t.string :password
      t.string :email
      t.string :salt
      t.boolean :is_admin

      t.timestamps
    end
  end
end

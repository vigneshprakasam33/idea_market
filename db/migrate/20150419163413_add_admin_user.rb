class AddAdminUser < ActiveRecord::Migration
  def change
    u = User.new(:uname => "tartan" , :email => "tartan@cmu.edu" , :password => "foobar" , :is_admin => true)
    u.save
  end
end

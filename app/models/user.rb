require 'bcrypt'

class User < ActiveRecord::Base

  # users.password_hash in the database is a :string
  include BCrypt
  before_create :set_uuid
  attr_accessor :password
  after_destroy :delete_ideas

  validates_presence_of :uname , :email


  def self.login(u, p)
    user = User.find_by_uname(u)

    if user and user.password_hash == BCrypt::Engine.hash_secret(p, user.salt)
      return user, :success
    else
      return false, :bad_auth
    end
  end

  def delete_ideas
    Idea.where(:user_id => self.id).destroy_all
    Idea.where(:taken_up_id => self.id).update_all(:taken_up_id => nil)
  end

  def set_uuid
    self.uuid = SecureRandom.uuid.gsub(/[^0-9]/, '')
    self.salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, salt)
  end


end

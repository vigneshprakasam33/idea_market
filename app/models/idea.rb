class Idea < ActiveRecord::Base
  belongs_to :platform
  belongs_to :role
  belongs_to :user
end

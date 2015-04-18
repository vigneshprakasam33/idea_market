class Idea < ActiveRecord::Base
  belongs_to :platform
  belongs_to :role
end

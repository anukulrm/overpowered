class Chain < ActiveRecord::Base
  attr_accessible :description, :goal_id, :name
  belongs_to :goal
end

class Goal < ActiveRecord::Base
  attr_accessible :description, :end_date, :name
  has_many :chains
end

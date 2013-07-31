class Goal < ActiveRecord::Base
  attr_accessible :description, :end_date, :name
  has_many :chains
  has_many :tasks, through: :chains

  def as_json(options={})
    super(include: [:tasks, :chains])
  end
end

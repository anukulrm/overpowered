class Task < ActiveRecord::Base
  attr_accessible :chain_id, :name, :notes, :begin, :duration, :completed_on

  def completed?
    self.completed_on.present?
  end
end

class Task < ActiveRecord::Base
  attr_accessible :name, :notes, :begin, :duration, :completed_on, :parent_id

  has_many :children, class_name: "Task",
                      foreign_key: "parent_id"

  belongs_to :parent, class_name: "Task"

  def completed?
    self.completed_on.present?
  end

end

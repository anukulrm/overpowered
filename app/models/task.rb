class Task < ActiveRecord::Base
  #the duration is stored in minutes
  attr_accessible :name, :notes, :begin, :duration, :completed_on, :parent_id
  validates_presence_of :name

  has_many :children, class_name: "Task",
           foreign_key: "parent_id"

  belongs_to :parent, class_name: "Task"

  def completed?
    self.completed_on.present?
  end

  def not_completed?
    self.completed_on.nil?
  end

  #the duration is stored in minutes
  def set_duration(duration)
    duration = Integer(duration)
    #if the task is completed then we can set the beginning time
    #from the just added duration time
    self.duration = duration
    if self.completed? and self.begin == nil
      begin_from_completed_duration
    end
  end

  #updates the begin if the completed_on and duration are set
  #returns a string error message if these aren't set
  def begin_from_completed_duration
    if self.duration != nil and self.completed?
      self.begin = (self.completed_on.to_time - (self.duration.minutes)).to_datetime
    else
      "Error: duration and complete_on not set."
    end
  end

  #Sets the task to completed to Time.now
  #if begin hasn't been set it sets it to the same as completed
  #if begin is set then it will automatically fill in the duration as the difference
  def set_completed
    self.completed_on = Time.now
    if self.duration != nil
      begin_from_completed_duration
    end
    if self.begin == nil
      self.begin = self.completed_on
      self.duration = 0
    else
      #begin is set and we just set completed so lets set the duration
      self.duration = Integer((self.completed_on.to_time - self.begin.to_time)/60)
    end
  end

  #Get all the leaf tasks given a root
  #This will be used to get the specific tasks that currently need to be done
  def leaf_tasks

  end

  #Get the incomplete children of a node

  def get_incomplete_children
    incomplete_children = []
    self.children.each do |t|
      if t.not_completed?
        incomplete_children.append(t)
      end
    end
    incomplete_children
  end

  def get_complete_children
    complete_children = []
    self.children.each do |t|
      if t.completed?
        complete_children.append(t)
      end
    end
  end

  def root?
    self.parent.nil?
  end
end

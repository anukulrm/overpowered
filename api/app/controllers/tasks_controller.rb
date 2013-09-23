class TasksController < ApplicationController
  def index
    render json: Task.all
  end
  def show
    render json: Task.find(params[:id])
  end
  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      format.json { render json: @task }
    end
  end
=begin
  def new
    @task = Task.new()
    respond_to do |format|
      format.json { render json: @task }
    end
  end

  def show
    render json: Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.nil?
        #error
      else
        format.json { render json: {:success => true,
                                    :task => @task.as_json} }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.json { render json: @task }
      else
        #error error error
      end
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end
=end
end

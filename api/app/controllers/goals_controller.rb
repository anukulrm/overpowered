class GoalsController < ApplicationController

  def new
    @goal = Goal.new()
    respond_to do |format|
      format.json { render json: @goal }
    end
  end

  def create
    @goal = Goal.new(params[:goal])
    respond_to do |format|
      format.json { render json: @goal }
    end
  end

  def show
    @goal = Goal.find(params[:id])
    respond_to do |format|
      if @goal.nil?
        #error
      else
        format.json { render json: {:success => true,
                                    :goal => @goal.as_json} }
      end
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    respond_to do |format|
      if @goal.nil?
        #error
      else
        format.json { render json: {:success => true,
                                    :goal => @goal.as_json} }
      end
    end
  end

  def update
    @goal = Goal.find(params[:id])
    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.json { render json: @goal}
      else
        #error error error
      end
    end
  end

  def destroy
    Goal.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end
end

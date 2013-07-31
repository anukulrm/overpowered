class ChainsController < ApplicationController

  def new
    @chain = Chain.new()
    respond_to do |format|
      format.json { render json: @chain }
    end
  end

  def create
    @chain = Chain.new(params[:chain])
    respond_to do |format|
      format.json { render json: @chain }
    end
  end

  def show
    @chain = Chain.find(params[:id])
    respond_to do |format|
      if @chain.nil?
        #error
      else
        format.json { render json: {:success => true,
                                    :chain => @chain.as_json} }
      end
    end
  end

  def edit
    @chain = Chain.find(params[:id])
    respond_to do |format|
      if @chain.nil?
        #error
      else
        format.json { render json: {:success => true,
                                    :chain => @chain.as_json} }
      end
    end
  end

  def update
    @chain = Chain.find(params[:id])
    respond_to do |format|
      if @chain.update_attributes(params[:chain])
        format.json { render json: @chain }
      else
        #error error error
      end
    end
  end

  def destroy
    Chain.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :ok }
    end
  end

end

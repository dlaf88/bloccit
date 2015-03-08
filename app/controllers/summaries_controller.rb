class SummariesController < ApplicationController
  def index
     @summary= Summary.new
  end

  def new
    @summary= Summary.new
  end

  def show
  end

  def edit
      @summary = Summary.find(params[:id])
  end
  
  def update
    
     @summary = Summary.find(params[:id])
     
     if @summary.update_attributes(params.require(:summary).permit(:description))
       redirect_to @summary
       flash[:notice] = "You edited successfully"
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
    
  
    
  end 
end

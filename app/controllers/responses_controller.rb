class ResponsesController < ApplicationController
  
  def index
  end
  
  def new
   
  end

  def create
  
  end

  def edit
    @response = current_user.response
    @checklist = Checklist.find(params[:id])
  end

  def update
    @response = current_user.response
    @response.update_attributes(answers_hash: params[:spaceship])
    redirect_to checklists_path
    
  end

  def show
  end
end

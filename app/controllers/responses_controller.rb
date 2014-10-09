class ResponsesController < ApplicationController
  
  def index
  end
  
  def new
   
  end

  def create
  
  end

  def edit
    @response = current_user.response
    # @response.import_checklist
    @checklist = Checklist.find(params[:id])
  end

  def update
    @response = current_user.response
    binding.pry
    @response.update_attributes(answers_hash: {params[:name] => params[:value]})
    redirect_to root_url
  end

  def show
  end
end

class ResponsesController < ApplicationController
  
  def index
  end
  
  def new
   
  end

  def create
  @response = Response.new
    if @response.save
     redirect_to :root
    else
     render :new
    end
  end

  def edit
    @response = current_user.response
    # @response.import_checklist
    @checklist = Checklist.find(params[:id])
  end

  def update
  end

  def show
  end
end

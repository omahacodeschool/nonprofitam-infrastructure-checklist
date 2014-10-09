class ResponsesController < ApplicationController
  
  def index
  end
  
  def new
    @response = Response.new
    @checklist = Checklist.find(params[:id])
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
  end

  def update
  end

  def show
  end
end

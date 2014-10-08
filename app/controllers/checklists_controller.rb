class ChecklistsController < ApplicationController
  
  def index
    @checklists = Checklist.all 
  end
  
  def new
    @checklist = Checklist.new
    3.times do
      question = @checklist.questions.build
      
    end
  end
  
  def create 
    @checklist = Checklist.new(params[:checklist])
    if @checklist.save 
      redirect_to checklists_path, :notice => "Checklists created!" 
    else 
      render :new
    end
  end
  
  def edit
    @checklist = Checklist.find(params[:id])
  end
  
  def update 
    @checklist = Checklist.find(params[:id])
      
    if @checklist.update_attributes(params[:checklist])
      redirect_to checklist_path(@checklist.id)
    else
      render :edit
    end
  end
  
  
  def show 
    @checklist = Checklist.find(params[:id])
  end
  
  
  def destroy 
  end
  
  
  
  
end

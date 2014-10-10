class ChecklistsController < ApplicationController
  
  def index
    @checklists = Checklist.all
    @user = User.find(current_user.id)
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
      redirect_to checklists_path, :notice => "Checklist created!" 
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
  
  
  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.delete
    
    redirect_to checklists_path
  end
  
  
  def show 
    @checklist = Checklist.find(params[:id])
  end
  
  
  
  
  
  
end

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
  end
  
  def update 
  end
  
  
  def show 
  end
  
  
  def destroy 
  end
  
  
  
  
end

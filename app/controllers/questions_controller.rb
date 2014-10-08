class QuestionsController < ApplicationController
  
  
  
  def new
    @question = Question.new
   
    respond_to do |format|
      format.js
      format.html
  end
end
end
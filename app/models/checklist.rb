class Checklist < ActiveRecord::Base
  attr_accessible :name, :questions_attributes
  
  
  has_many :questions 
  accepts_nested_attributes_for :questions, allow_destroy: true\
  
  
  # Public: Counts the integer total amount of questions associated to a given Checklist(n)
  #
  # @hecklist  - A given ActiveRecord Checklist
  # @total - Uses ActiveRecord associations to find number of questions
  #
  # Examples
  #
  #   total_questions(3)
  #   # => 10
  #
  def total_questions
      total =  self.questions.length
      total 
    end
  
end

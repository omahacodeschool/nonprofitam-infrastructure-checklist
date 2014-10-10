class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id, :answer_hash["key"]
  
  serialize(:answers_hash, Hash)
  belongs_to :user
    
  
    # Public: Returns the integer total amount of a given answer(n)
    #
    # a_hash - The ActiveRecord answer_hash of a given response object
    # answers - Array of 'values' for each 'key' in the a_hash
    # count - counts the amount of times a given value[n] is found in "answers"
    #
    # Examples
    #
    #   counts("Yes")
    #   # => 16
    #
    #  counts("No")
    #   # => 3
    #
  def counts(n) 
    count = Hash.new(0)
    a_hash = self.answers_hash
    answers = a_hash.values
    answers.each{ |ans| count[ans] += 1}
    count[n]
  end
  
  
  # Public: Returns a string corresponding to the percentage that a given 
  #
  # a_hash - The ActiveRecord answer_hash of a given response object
  # answers - Array of 'values' for each 'key' in the a_hash
  # count - counts the amount of times a given value[n] is found in "answers"
  #
  # Examples
  #
  #   counts("Yes")
  #   # => 16
  #
  #  counts("No")
  #   # => 3
  #
  
  def percent(value, checklist_id)
    ans = []
    
    Checklist.find(checklist_id).questions.each do |q|
      ans << self.answers_hash["#{q.id}"] 
    end
    count = Hash.new(0)
    ans.each{ |e| count[e] += 1 }
    (((count[value].to_f/Checklist.find(checklist_id).total_questions.to_f)*100).to_i).to_s + "%"
   end
  
    
end

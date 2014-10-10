class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id
  
  serialize(:answers_hash, Hash)
  belongs_to :user

  def counts(n) 
    count = Hash.new(0)
    a_hash = self.answers_hash
    answers = a_hash.values
    answers.each{ |ans| count[ans] += 1}
    
    count[n]
  end
  
  # def percent(counts(n))
  #   percent = count(n) * 100
  # end
    
  
end

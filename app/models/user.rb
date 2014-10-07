class User < ActiveRecord::Base
   attr_accessible :email, :password, :password_confirmation, :org_name, :admin
  
  authenticates_with_sorcery!
  
 
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end


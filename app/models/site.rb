class Site < ActiveRecord::Base
  has_many :tasks
  
  
  def to_param
    "#{name}"  
  end
  
end

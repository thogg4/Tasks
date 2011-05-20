class Task < ActiveRecord::Base
  
  validates_presence_of :name
  
  belongs_to :site
  has_many :comments
  
  mount_uploader :file, FileUploader
end


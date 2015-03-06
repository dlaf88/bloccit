class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
 #def self.ordered_by_title
 #  self.order(:title)
 # end 
  
  scope :ordered_by_title, -> {order(:title)}
  
  scope :ordered_by_reversed_created_at, -> {order(created_at: :desc )}
  
  
 
end

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  
  
  validates :name, length: { minimum: 5 }, presence: true
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :public_vis, -> { where(public: true) }
  scope :private_vis, -> { where(public: false) }
end

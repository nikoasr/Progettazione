class Group < ActiveRecord::Base
    belongs_to :exam
    belongs_to :user
    
    has_many :members
    
    validates :message, :date, :location, :presence => true
end

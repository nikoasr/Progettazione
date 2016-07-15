class Tutor < ActiveRecord::Base
    belongs_to :exam
    
    validates :cel, :email, :presence => true

end

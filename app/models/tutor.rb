class Tutor < ActiveRecord::Base
    belongs_to :exam
    
    validates :cel, :presence => true, numericality: { only_integer: true }
    validates :email,   
        :presence => true,
        :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
        

end

class Exam < ActiveRecord::Base
    has_many :groups
    has_many :tutors
    
    validates :nome, :anno, :professore, :sito, :presence => true
end

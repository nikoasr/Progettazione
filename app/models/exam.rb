class Exam < ActiveRecord::Base
    has_many :groups
    
    validates :nome, :anno, :professore, :sito, :presence => true
end

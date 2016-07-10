class ExamsController < ApplicationController
    before_action :current_user, only: [:show]
    
    before_action :find_exam, only: [:show]
    
    
    def index
        if params[:anno].blank?
			@exams = Exam.all.order("created_at DESC")
		else
			@exams = Exam.where(:anno => params[:anno]).order("created_at DESC")
		end
    end
    
    def show
        
    end
    
    private
       
        def exam_params
			params.require(:exam).permit(:nome, :anno)
		end

		def find_exam
			@exam = Exam.find(params[:id])
		end
	
end

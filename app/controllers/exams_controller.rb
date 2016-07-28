class ExamsController < ApplicationController
    before_action :find_exam, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
    before_action :admin!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        if params[:anno].blank? && params[:src].blank?
			@exams = Exam.all.order("nome")
		elsif params[:anno] && params[:src].blank?
			@exams = Exam.where(:anno => params[:anno]).order("nome")
		elsif params[:anno].blank? && params[:src]
			@exams = Exam.where("nome like ?", "%#{params[:src].titleize}%").order("nome")
		else 
			@exams = Exam.where(:anno => params[:anno]).where("nome like ?", "%#{params[:src].titleize}%").order("nome")
		end
    end
    
    def new
        @exam = Exam.new
    end    
    
    def create
    	@exam = Exam.new(exam_params)
		if @exam.save
			redirect_to root_path
		else
			render 'new'
		end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    	if @exam.update(exam_params)
			redirect_to exam_path(@exam)
		else
			render 'edit'
		end
	end
    
    def destroy
		Member.where(:exam_id => @exam.id ).each do |mem|
			mem.destroy
		end
		
		Group.where(:exam_id => @exam.id ).each do |gro|
			gro.destroy
		end
		
		Tutor.where(:exam_id => @exam.id ).each do |tut|
			tut.destroy
		end
		
		@exam.destroy
		redirect_to root_path
	end
    
    private
       
        def exam_params
			params.require(:exam).permit(:nome, :anno, :professore, :sito, :professore2)
		end

		def find_exam
			@exam = Exam.find(params[:id])
			rescue ActiveRecord::RecordNotFound => e
				flash[:alert] = "Esame Non Trovato"
				redirect_to root_path
		end
	
end

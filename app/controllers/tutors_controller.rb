class TutorsController < ApplicationController
    
    before_action :find_exam
	before_action :find_tutor, only: [:edit, :update, :destroy, :show]
	before_action :authenticate_user!, only: [:new, :edit, :show]

	def index
		redirect_to exam_path(@exam)
	end
	
	def show
		
	end
	
	def new
		@tutor = Tutor.new
	end

	def create
		@tutor = Tutor.new(tutor_params)
		@tutor.exam_id = @exam.id
		@tutor.user_id = current_user.id
		

		if @tutor.save
			redirect_to exam_path(@exam)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @tutor.update(tutor_params)
			redirect_to exam_path(@exam)
		else
			render 'edit'
		end
	end

	def destroy
		@tutor.destroy
		redirect_to exam_path(@exam)
	end

	private

		def tutor_params
			params.require(:tutor).permit(:cel, :email)
		end

		def find_exam
			@exam = Exam.find(params[:exam_id])
		end

		def find_tutor
			@tutor = Tutor.find(params[:id])
		end


end

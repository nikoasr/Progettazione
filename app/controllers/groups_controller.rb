class GroupsController < ApplicationController
    before_action :find_exam
	before_action :find_group, only: [:edit, :update, :destroy, :show]
	before_action :authenticate_user!, only: [:new, :edit, :show]

	def index
		redirect_to exam_path(@exam)
	end
	
	def show
		
	end
	
	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.exam_id = @exam.id
		@group.user_id = current_user.id
		

		if @group.save
			redirect_to exam_path(@exam)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @group.update(group_params)
			redirect_to exam_path(@exam)
		else
			render 'edit'
		end
	end

	def destroy
		@group.destroy
		redirect_to exam_path(@exam)
	end

	private

		def group_params
			params.require(:group).permit(:message, :location, :datetime)
		end

		def find_exam
			@exam = Exam.find(params[:exam_id])
		end

		def find_group
			@group = Group.find(params[:id])
		end

end

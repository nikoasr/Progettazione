class MembersController < ApplicationController
	before_action :find_exam, only: [:new, :destroy]
	before_action :find_group, only: [:new, :edit, :update, :destroy, :show]
	before_action :authenticate_user!, only: [:new, :edit, :show, :destroy]
    
    def index
		redirect_to exam_path(@exam)
	end
	
	def show
		redirect_to exam_path(@exam)
	end
	
	def edit
	    redirect_to exam_path(@exam)
	end
	
	def update
	    redirect_to exam_path(@exam)
	end
	
	def new
		if Member.where(:user_id => current_user.id, :group_id => @group.id).count > 0
			redirect_to exam_path(@exam)
			return
		end
		
		@member = Member.new
		@member.group_id = @group.id
		@member.user_id = current_user.id
		@member.exam_id = @group.exam_id
		

		if @member.save
			redirect_to exam_path(@exam)
		else
			render 'new'
		end
	end

	def create
		@member = Member.new(member_params)
		@member.group_id = @group.id
		@member.user_id = current_user.id

		if @member.save
			redirect_to exam_path(@exam)
		else
			render 'new'
		end
	end

	def destroy
		@member = Member.find(params[:id])
		@member.destroy
		redirect_to exam_path(@exam)
	end

	private

		def member_params
			params.require(:member).permit()
		end

		def find_exam
			@exam = Exam.find(params[:exam_id])
		end

		def find_group
			@group = Group.find(params[:group_id])
		end
end

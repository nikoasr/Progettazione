class GroupsController < ApplicationController
    before_action :find_exam
	before_action :find_group, only: [:edit, :update, :destroy, :show]
	before_action :authenticate_user!, only: [:new, :edit, :show, :destroy]
	before_action :owner!, only: [:edit, :destroy]
	
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
		
		@member = Member.new
		
		@member.exam_id = @exam.id
		@member.user_id = current_user.id
		
		
		if @group.save
			@member.group_id = @group.id
			if @member.save
				flash[:notice] = "Gruppo Creato"
				redirect_to exam_path(@exam)
			end
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @group.update(group_params)
			flash[:notice] = "Gruppo Modificato"
			redirect_to exam_path(@exam)
		else
			render 'edit'
		end
	end

	def destroy
		Member.where(:group_id => @group.id ).each do |mem|
			mem.destroy
		end
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
			rescue ActiveRecord::RecordNotFound => e
				flash[:alert] = "Gruppo Non Trovato"
				redirect_to root_path
		end
		
		def owner!
	     if current_user.id != @group.user_id
	      flash[:alert] = "Accesso Negato"
	      redirect_to root_path
	     end
	    end
	    helper_method :owner!

end

class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "User added successfully."
			redirect_to @user
		else
			flash[:alert] = "Error adding user."
			render 'new'
		end
	end


	private 
	
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end

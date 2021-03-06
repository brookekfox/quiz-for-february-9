class UsersController < ApplicationController

	def index
		@users = User.all
		# @users.sort_by! {|a| a[:username].downcase}
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params.require(:user).permit(:username, :email, :birthdate))
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params.require(:user).permit(:username, :email, :birthdate))
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

end

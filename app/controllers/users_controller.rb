class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "User created."
			redirect_to users_path
		else
			flash[:alert] = "User not created."
			redirect_to :back
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params[:user])
			flash[:notice] = "User updated."
			redirect_to users_path
		else
			flash[:alert] = "User not updated."
			redirect_to :back
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user && @user.destroy
			flash[:notice] = "Your user was destroyed."
		else
			flash[:alert] = "Your user could not be destroyed."
		end
		redirect_to users_path
	end

end
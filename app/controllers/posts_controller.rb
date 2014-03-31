class PostsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = params[:user_id]
		if @post.save
			flash[:notice] = "Post created."
			redirect_to user_posts_path(@post.user, @post)
		else
			flash[:alert] = "Post not created."
			redirect_to :back
		end
	end

	def edit
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post])
			flash[:notice] = "Post updated."
			redirect_to user_posts_path(@post.user, @post)
		else
			flash[:alert] = "Post not updated."
			redirect_to :back
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Your user was destroyed."
		else
			flash[:alert] = "Your user could not be destroyed."
		end
		redirect_to user_posts_path

	end


end

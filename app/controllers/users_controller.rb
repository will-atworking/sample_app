class UsersController < ApplicationController
	before_action :signed_in_user, 	only: [:index, :edit, :update, :destroy]
	before_action :correct_user, 	only: [:edit, :update]
	before_action :admin_user,		only: :destroy
	
	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = 'Welcome to the Sample App!'
			redirect_to @user
		else
			render 'new'
		end
	end

	def destroy
		@user_to_delete = User.find(params[:id])
		if current_user?(@user_to_delete)
			flash[:error] = "You cannot delete yourself"
			redirect_to(user_path(@user_to_delete))
		else
			@user_to_delete.destroy
			flash[:success] = "User deleted."
			redirect_to users_url
		end
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

		def user_params 
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		# Before filters
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end

end

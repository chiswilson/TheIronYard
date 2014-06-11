class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_for_admin

	def index
		if current_user.master_admin?
		    @users = User.all
		elsif current_user.admin? && (current_user.account)
			# account = current_user.account
			@users = current_user.account.users
		else
			@users = []
		end
	end

	def show
		@user = User.find params[:id]
	end

	def new

	end

	def edit
		@user = User.find params[:id]
	end

	def create
	end

	def update
		@user = User.find params[:id]
	end

	def destroy
		@user = User.find params[:id]
	end


	private

	  def user_params
        params.require(:user).permit(:name, :admin, :email )
      end

      def check_for_admin
      	if (not current_user.admin?) && (not current_user.master_admin?)
      		redirect_to root_path
      	end
      end


end

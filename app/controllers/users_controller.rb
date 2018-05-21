class UsersController < ApplicationController

	skip_before_action :verify_authenticity_token
	
	def index
		if params[:email]
			@user = User.find_by(:email => params[:email])
			if @user
				render json: Response.new.success('user present', @user, @user.acess_token)
			else
				render json: Response.new.failure('user not present', nil )
			end
		elsif params[:acess_token]
			@user = User.find_by_acess_token(params[:acess_token])
			if @user
				render json: Response.new.success('user present', @user, @user.acess_token)
			else
				render json: Response.new.failure('user not present', nil )
			end		
		else	
			@users = User.all
			render json: Response.new.success('All Appointments', @users, @user.acess_token)
		end  
	end

	# def update
	# 	binding.pry
	# 	@user = User.find_by_acess_token(params[:acess_token])
	# 	@user.update(:acess_token => nil)
	# end
end
class ApiController < ApplicationController
	protect_from_forgery with: :null_session


	private
	
	def current_user
      
    end
    
 #  	def check_for_valid_authtoken

	# 	authenticate_or_request_with_http_token do |token, options|   
	# 		puts token  
	# 		@user = User.where(:access_token => token).first  if   !User.where(:access_token => token).first.nil?  
	# 		if !@user 
	# 			render json: Response.new.success('Please Login', nil)   
	# 		else
	# 			render json: Response.new.success('Sign in', @user)
	# 			return true
	# 		end
	# 	end
	# end
end



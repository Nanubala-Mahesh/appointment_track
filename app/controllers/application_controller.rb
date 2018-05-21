class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
	
	private
	
	def check_for_valid_authtoken

		token = request.headers.fetch('Authorization', '').split(' ').last
		
		@current_user = User.find_by(:acess_token => token)  #if   !User.find_by(:acess_token => token).first.nil?  
		# binding.pry
		render json: Response.new.failure('Please Login', nil) unless @current_user
	end
end

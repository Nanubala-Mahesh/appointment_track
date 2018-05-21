# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def create
    build_resource
    # binding.pry

    resource = User.find_for_database_authentication(:email => params[:email])
    # binding.pry
    
    # return invalid_login_attempt unless resource

    # binding.pry
    if resource.present?
      if resource.valid_password?(params[:password])
      # binding.pry

      resource.update(:acess_token => SecureRandom.hex)
      
        sign_in("user", resource)
      # binding.pry
        @user = User.find_by(email: params[:email] )
        render json: Response.new.success('Sign in ', @user, @user.acess_token )
        # render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
      # binding.pry
      
        return
      end
    else
      # binding.pry

      render json: Response.new.failure('Cannot Sign in ', nil )
    end
    # invalid_login_attempt
    # render :json=> {:success=>false, :auth_token=>nil, :login=>nil, :email=>resource.email}
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def build_resource(hash=nil)
    # binding.pry
    self.resource = resource_class.new_with_session(hash || {}, session)
    # binding.pry
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

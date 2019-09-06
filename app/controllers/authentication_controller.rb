# create the auth token
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!

  def authenticate
    command = AuthenticateUserHelper.call(params[:email], params[:password])
    if command.success?
      json_response(auth_token: command.result)
    else
      json_response({ error: command.errors }, status: :unauthorised)
    end
  end
end

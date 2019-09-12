# create the auth token
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # will be called for the first time with user name and password and return
  # the token if valid
  def authenticate
    command = AuthenticateUserHelper.call(params[:email], params[:password])
    if command.success?
      json_response(auth_token: command.result[0], user: command.result[1])
    else
      json_response({ error: command.errors }, status: :unauthorised)
    end
  end
end

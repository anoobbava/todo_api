# frozen_string_literal: true

# create the auth token
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # will be called for the first time with user name and password and return
  # the token if valid
  def authenticate
    command = AuthenticateUserHelper.call(params[:email], params[:password])
    # binding.pry
    if command.success?
      json_response(auth_token: command.result[0], user: command.result[1])
    else
      json_response(command.errors, 401)
    end
  end
end

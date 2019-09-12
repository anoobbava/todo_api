# frozen_string_literal: true

class AuthenticateUserHelper
  prepend SimpleCommand

  # need to initialize for the data for the command
  def initialize(email, password)
    @email = email
    @password = password
  end

  # this method will be needed by command
  # since this is for the
  def call
    # after user login, will pass the user-id to the JWT to create token
    return nil unless user

    return JsonWebToken.create_token(user_id: user.id), user
  end

  private

  attr_accessor :email, :password

  def user
    # check with username and password to login and fetch the user object
    user = User.find_by_email(email)
    # authenticate is coming from has_secure_password from bcrypt gem
    if user && user.authenticate(password)
      user
    else
      errors.add(:user_authentication, 'invalid user name or password')
      nil
    end
  end
end

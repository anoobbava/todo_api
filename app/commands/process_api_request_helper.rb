# frozen_string_literal: true

# deals with check the token from the API and gives the access.
class ProcessApiRequestHelper
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  # it is the standard form for the command, call and intialize
  def call
    fetch_user_from_auth_token
  end

  private

  attr_reader :headers
  # check the incoming API got the Token
  def verify_header
    # normal header like sample ==> Authorization 'ddd$$%gggrghHFDSS.HHJHTTGGR'
    if headers['Authorization'].present?
      headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing Token')
      nil
    end
  end

  # decode the token coming from authorization
  def decode_auth_token
    return nil unless verify_header

    JsonWebToken.decode_token(verify_header)
  end

  # fetch the user from auth token
  def fetch_user_from_auth_token
    @user = User.find(decode_auth_token[user_id]) if decode_auth_token
    @user = nil
    errors.add(:token, 'invalid token')
  end
end

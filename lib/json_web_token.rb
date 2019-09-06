# singleton class , restricts the instantiation
class JsonWebToken
  class << self

    # create the jwt token using JWT
    def create_token(payload, exp = 24.hours.from_now)
      # it will work wihtout :exp object time, but we are adding that to make it
      # more unique
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode_token(token)
      # need to check what is the below data is coming
      binding.pry
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    end

  end
end
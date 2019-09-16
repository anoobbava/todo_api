# singleton class , restricts the instantiation
class JsonWebToken
  class << self

    # create the jwt token using JWT
    def create_token(payload, exp = 24.hours.from_now)
      # it will work wihtout :exp object time, but we are adding that to make it
      # more unique
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV['JWT_TOKEN_SECRET'])
    end

    def decode_token(token)
      response = JWT.decode(token, ENV['JWT_TOKEN_SECRET'])[0]
      # will have the data [{"user_id"=>1, "exp"=>1568185252}, {"typ"=>"JWT", "alg"=>"HS256"}]
      # need to strip and fetch the user_id
      HashWithIndifferentAccess.new response
    end

  end
end
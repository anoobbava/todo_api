module Response
    def json_reponse(object, status = :ok)
        render json: object, status: status
    end
end
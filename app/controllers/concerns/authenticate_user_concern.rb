module AuthenticateUserConcern
    # taking in all the active support funcitons
    extend ActiveSupport::Concern

    # Our method for authenticating the user 
    def authenticate_user

        # Getting the authorization header from the request
        authorization_header = request.headers[:authorization]
        
        # Checking the header for errors 
        if authorization_header
            token = authorization_header.split(" ")[1]
            secret_key = Rails.application.secret_key_base
            
            decoded_token = JWT.decode(token, secret_key)[0]

            @user = User.find(decoded_token["user_id"])
        else
            render status: :unauthorized
        end
    end

end
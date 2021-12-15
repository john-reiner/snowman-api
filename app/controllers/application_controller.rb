class ApplicationController < ActionController::API
    include AuthenticateUserConcern
end

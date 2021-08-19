class ApplicationController < ActionController::API
    rescue_from Exception, with: :deny_access

    private
    def deny_access
        render json: {message: "Insufficient information / Service Unavailable", status: "Error"}, status: 500
    end
end

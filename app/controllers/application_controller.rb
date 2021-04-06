class ApplicationController < ActionController::Base
    helper_method :current_user
    beforeuired_action :login_req

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login-required
        redirect_to login_url unless current_user
    end

end

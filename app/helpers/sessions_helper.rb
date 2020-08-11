module SessionsHelper
    #logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end

    #returns the current logged in user(if any)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    #returns true if the given user is logged in
    def current_user?(user)
        user && user == current_user
    end

    #returns true if the user is logged in
    def logged_in?
        !current_user.nil?
    end

    #logs out the current user
    def log_out
        reset_session
        @current_user = nil
    end

    #stores the URL trying to be accessed
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end

end

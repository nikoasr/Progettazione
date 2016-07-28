class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def authenticate_user!
     if current_user.nil?
      flash[:alert] = "Effettua l'accesso!"
      redirect_to root_path
     end
    end
    helper_method :authenticate_user!
    
    def admin!
     if current_user.id != 1
      flash[:alert] = "Accesso Negato"
      redirect_to root_path
     end
    end
    helper_method :admin!
    
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
   
end

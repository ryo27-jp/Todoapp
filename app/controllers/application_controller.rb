class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      redirect_to login_url unless current_user
    end

    def editor_user
      @editor_user ||= @current_user unless @current_user&.editor_id
    end

    def viewer_user
      @editor_user ||= @current_user if @current_user&.editor_id
    end
end

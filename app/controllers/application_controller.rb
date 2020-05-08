class ApplicationController < ActionController::Base
  respond_to :html, :json
  # protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  # acts_as_token_authentication_handler_for User
    
  protected
  def check_admin!
    unless current_user.admin?
      render status: 403, plain: 'Please Sign In as Admin to Access'
    end
  end
end

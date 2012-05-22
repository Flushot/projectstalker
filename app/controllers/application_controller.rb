class ApplicationController < ActionController::Base
  before_filter :mailer_set_url_options
  #protect_from_forgery
  respond_to :json

  class AccessDenied < StandardError; end
  rescue_from AccessDenied, :with => :access_denied

protected
  def current_user
    User.find_by_id(session[:user_id])
  end

  def authorize
    unless current_user
      head :status => :unauthorized
    end
  end

  def require_admin_role
    raise ApplicationController::AccessDenied \
      unless current_user && current_user.has_role('admin')
  end

private
  def access_denied
    redirect_to '/401.html'
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end

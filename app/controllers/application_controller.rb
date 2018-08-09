require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  include AuthorizationHelper
  include Pundit
  protect_from_forgery with: :exception
  #check_authorization

  #Redirects to login for secure resources
  rescue_from CanCan::AccessDenied do |exception|

    if user_signed_in?
      flash[:error] = "Not authorized to view this page"
      session[:user_return_to] = nil
      redirect_to '/403'

    else
      flash[:error] = "You must first login to view this page"
      session[:user_return_to] = request.url
      redirect_to new_user_session_path
    end

  end


  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include Hobo::Controller::AuthenticationSupport
  before_filter :except => [:login, :signup, :activate, :do_activate, 
    :do_signup, :forgot_password, :reset_password, 
    :do_reset_password] do
      login_required unless User.count == 0
  end

end

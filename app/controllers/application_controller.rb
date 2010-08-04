# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def after_sign_in_path_for(resource)
    if current_student
      dashboard_path
    elsif current_user.role? :inspetor
      admin_files_path
    else
      courses_path
    end
  end

  def current_ability
    if student_signed_in?
      @current_ability ||= StudentAbility.new(current_student)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = "Você não está autorizado a acessar essa página."
      redirect_to root_url
  end
end


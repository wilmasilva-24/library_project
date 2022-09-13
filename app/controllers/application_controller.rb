class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  private

 def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:error] = 'Usuário sem permissão para executar essa ação.'
   redirect_to root_path
 end
end

class Admin::ApplicationController < ActionController::Base
  protect_from_forgery

  def current_administrator
      if session[:current_administrator_id] != nil
          @_current_administrator = Usuario.find(session[:current_administrator_id])
        else
          @_current_administrator = nil
        end

      return @_current_administrator
  end

  def current_cooperativa
      if session[:current_cooperativa_id] != nil
        @_current_cooperativa = Usuario.find(session[:current_cooperativa_id])
      else
        @_current_cooperativa = nil
      end

      return @_current_cooperativa
  end

  def administrador_logado
		if self.current_administrator == nil
			if self.current_cooperativa == nil
			  flash[:notice] = 'Area Restrita - necessario login'
		 		redirect_to :controller => 'Logins', :action => 'index'
			else
			  if params[:id] != self.current_cooperativa.id
			    flash[:notice] = 'Area Restrita - necessario login'
		 		  redirect_to :controller => 'Logins', :action => 'index'
		 		end
			end
		end
  end
end

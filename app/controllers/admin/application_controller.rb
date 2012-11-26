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
      flash[:notice] = 'Area Restrita - necessario login'
      redirect_to :controller => 'Logins', :action => 'index'
    end
  end

  def cooperativa_logado
		if self.current_cooperativa == nil
		  flash[:notice] = 'Area Restrita - necessario login'
	 		redirect_to :controller => 'Logins', :action => 'index'
		end
  end

  def cooperativa_administrador_logado
		if self.current_administrator == nil
			if self.current_cooperativa == nil
			  flash[:notice] = 'Area Restrita - necessario login'
		 		redirect_to :controller => 'Logins', :action => 'index'
			else
			  if (params[:cooperativa_id].nil?) or (!params[:cooperativa_id].nil? and Cooperativa.find(params[:cooperativa_id]) != self.current_cooperativa)
			    flash[:notice] = 'Area Restrita - necessario login'
		 		  redirect_to :controller => 'Logins', :action => 'index'
		 		end
			end
		end
  end

  def cooperativa_administrador_logado2
		if self.current_administrator == nil
			if self.current_cooperativa == nil
			  flash[:notice] = 'Area Restrita - necessario login'
		 		redirect_to :controller => 'Logins', :action => 'index'
		 	end
		end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_administrator
    
    if session[:current_administrator_id] != nil
      @_current_administrator = Administrador.find(session[:current_administrator_id])
    else
      @_current_administrator = nil
    end
        
    return @_current_administrator 
  end
  
  def administrador_logado
    if self.current_administrator == nil
      flash[:notice] = 'Área Restrita: necessário login'
      redirect_to :controller => 'Logins', :action => 'index'
    end
  end
end

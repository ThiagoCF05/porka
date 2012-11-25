class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_cooperativa
      if session[:current_cooperativa_id] != nil
        @_current_cooperativa = Usuario.find(session[:current_cooperativa_id])
      else
        @_current_cooperativa = nil
      end

      return @_current_cooperativa
  end

  def cooperativa_logada
      if self.current_cooperativa == nil
        flash[:notice] = 'Area Restrita - necessario login'
        redirect_to :controller => 'Logins', :action => 'index'
      end
  end

  def current_cliente
      if session[:current_cliente_id] != nil
        @_current_cliente = Cliente.find(session[:current_cliente_id])
      else
        @_current_cliente = nil
      end

      return @_current_cliente
  end

  def cliente_logado
      if self.current_cliente == nil
        flash[:notice] = 'Area Restrita - necessario login'
        redirect_to :controller => 'Logins', :action => 'index'
      end
  end
end

class LoginsController < ApplicationController
  before_filter :cooperativa_data
  def index
    respond_to do |format|
      if current_cooperativa == nil and current_cliente == nil
        format.html { render 'index.html.erb' }
      else
        format.html { render :controller => 'main', :action => 'index' }
      end
    end
  end

  def create_cooperativa_user
    @cooperativa = Usuario.where(:username => params[:username], :senha => params[:senha])[0]

    respond_to do |format|
      if @cooperativa == nil
      	flash[:notice] = 'Falha no Login.'
		  else
		    session[:current_cooperativa_id] = @cooperativa.id
		    flash[:notice] = 'Bem Vindo ' + @cooperativa.nome + '!'
		    format.html { redirect_to :controller => 'main', :action => 'index'  }
		  end
    end
  end

  def create_cliente_user
    @cliente = Cliente.where(:username => params[:username], :senha => params[:senha])[0]

    if @cliente == nil
      flash[:notice] = 'Falha no Login.'
    else
      session[:current_cliente_id] = @cliente.id
      flash[:notice] = 'Bem Vindo ' + @cliente.nome + '!'
    end

    respond_to do |format|
        format.html { render 'home.html.erb' }
    end
  end

  def destroy
    @_current_cooperativa = session[:current_cooperativa_id] = nil
    @_current_cliente = session[:current_cliente_id] = nil

    respond_to do |format|
        format.html { redirect_to :controller => 'main', :action => 'index'  }
    end
  end
end

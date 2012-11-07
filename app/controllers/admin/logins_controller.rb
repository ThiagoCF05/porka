class Admin::LoginsController < Admin::ApplicationController
  def index
    if current_administrator == nil
      render 'index.html.erb'
    else
      render 'home.html.erb'
    end
  end

  def create
    @administrador = Administrador.where(:username => params[:username], :senha => params[:senha])[0]

    if @administrador == nil
      flash[:notice] = 'Falha no Login.'
    else
      session[:current_administrator_id] = @administrador.id
      flash[:notice] = 'Bem Vindo ' + @administrador.nome + '!'
    end

    respond_to do |format|
        format.html { render 'home.html.erb' }
    end
  end

  def destroy
    @_current_administrator = session[:current_administrator_id] = nil

    respond_to do |format|
        format.html { render 'index.html.erb' }
    end
  end
end

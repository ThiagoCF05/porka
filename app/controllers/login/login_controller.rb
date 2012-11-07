class Login::LoginController < Admin::ApplicationController

  def index
    if current_administrator.nil?
      render 'index.html.erb'
    else
      render 'home.html.erb'
    end
  end

  def create
    @administrador = Administrador.find_by_username_and_senha(params[:username], params[:senha])
    if @administrador == nil
      flash[:notice] = 'Falha no Login'
      session[:current_administrator_id] = nil
      render 'index.html.erb'
    else
      session[:current_administrator_id] = @administrador.id
      render 'home.html.erb'
    end
  end

  def destroy

  end
end

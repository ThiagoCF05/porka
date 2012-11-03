class Login::LoginController < ApplicationController
  
  def index
    if current_administrator.nil?
      render 'index.html.erb'
    else
      render 'home.html.erb'
    end    
  end
  
  def create
    @administrador = Administrador.where :username => params[:username], :senha => params[:senha]
    
    if @administrador == nil
      flash[:notice] = 'Falha no Login'
  end
  
  def destroy
    
  end
end

class Login::LoginController < ApplicationController
  
  def index
    render 'index.html.erb'
  end
  
  def create
    @administrador = Administrador.where :username => params[:username], :senha => params[:senha]
    
    if @administrador == nil
      flash[:notice] = 'Falha no Login'
  end
  
  def destroy
    
  end
end

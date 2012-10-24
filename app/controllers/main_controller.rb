class MainController < ApplicationController
  
  # GET /main/index
  # GET /main/index.json
  def index
    @usuarios = Usuario.all
    @telefones = Telefone.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @telefones }
    end
  end
end
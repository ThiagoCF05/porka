class Admin::DestaquesController < ApplicationController
  before_filter :administrador_logado
  
  # GET admin/destaques
  # GET admin/destaques.json
  def index
    @destaques = Destaque.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @destaques }
    end
  end

  # POST admin/destaques/create
  # POST admin/destaques.json
  def create
    @destaque = Destaque.new
    @destaque.oferta = Oferta.find params[:id]
    @destaque.status = Status.find_by_descricao('Ativo')

    respond_to do |format|
      if @destaque.save
        format.html { redirect_to admin_destaques_path, :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @destaque, :status => :created, :location => @destaque }
      else
        format.html { render :action => "new" }
        format.json { render :json => @destaque.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/destaques/1
  # DELETE admin/destaques/1.json
  def destroy
    @destaque = Destaque.find(params[:id])
    @destaque.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_destaques_path }
      format.json { head :ok }
    end
  end
end

class Admin::OfertasController < ApplicationController
  before_filter :administrador_logado
  
  # GET admin/ofertas
  # GET admin/ofertas.json
  def index
    @ofertas = Oferta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ofertas }
    end
  end

  # GET admin/ofertas/1
  # GET admin/ofertas/1.json
  def show
    @oferta = Oferta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @oferta }
    end
  end

  # GET admin/ofertas/new
  # GET admin/ofertas/new.json
  def new
    @oferta = Oferta.new
    @oferta.cotacao = Cotacao.find(params[:id])
    @oferta.administrador = Administrador.first
    @oferta.data_inicio = @oferta.cotacao.data_inicio
    @oferta.data_fim = @oferta.cotacao.data_fim
    @oferta.valor_convite = @oferta.cotacao.valor

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @oferta }
    end
  end
  
  # GET admin/ofertas/aprovar
  # GET admin/ofertas/aprovar.json
  def aprovar
    @oferta = Oferta.new
    @oferta.cotacao = Cotacao.find(params[:id])
    @oferta.administrador = Administrador.first
    @oferta.data_inicio = @oferta.cotacao.data_inicio
    @oferta.data_fim = @oferta.cotacao.data_fim
    @oferta.valor_convite = @oferta.cotacao.valor
    @oferta.status = Status.find 2
    
    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @oferta }
    end
  end

  # GET admin/ofertas/1/edit
  def edit
    @oferta = Oferta.find(params[:id])
  end

  # POST admin/ofertas
  # POST admin/ofertas.json
  def create
    @oferta = Oferta.new(params[:oferta])

    respond_to do |format|
      if @oferta.save
        format.html { redirect_to [:admin, @oferta], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @oferta, :status => :created, :location => @oferta }
      else
        format.html { render :action => "new" }
        format.json { render :json => @oferta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/ofertas/1
  # PUT admin/ofertas/1.json
  def update
    @oferta = Oferta.find(params[:id])

    respond_to do |format|
      if @oferta.update_attributes(params[:oferta])
        format.html { redirect_to [:admin, @oferta], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @oferta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/ofertas/1
  # DELETE admin/ofertas/1.json
  def destroy
    @oferta = Oferta.find(params[:id])
    @oferta.destroy

    respond_to do |format|
      format.html { redirect_to admin_ofertas_path }
      format.json { head :ok }
    end
  end
end

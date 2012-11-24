class CotacaosController < ApplicationController
  # GET cotacaos
  # GET cotacaos.json
  def index
  	@cotacaos = Cotacao.where(:status_id => Status.find_by_descricao('Ativo'), 
  		coopertativa_id => Cooperativa.find(params[:id]))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cotacaos }
    end
  end

  # GET cotacaos/1
  # GET cotacaos/1.json
  def show
    @cotacao = Cotacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cotacao }
    end
  end

  # GET cotacaos/new
  # GET cotacaos/new.json
  def new
    @cotacao = Cotacao.new
    @cotacao.cooperativa = Cooperativa.find params[:id]

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @cotacao }
    end
  end

  # GET cotacaos/1/edit
  def edit
    @cotacao = Cotacao.find(params[:id])
  end

  # POST cotacaos
  # POST cotacaos.json
  def create
    @cotacao = Cotacao.new(params[:cotacao])
    @cotacao.status = Status.first

    respond_to do |format|
      if @cotacao.save
        format.html { redirect_to @cotacao, :notice => 'Cotacao was successfully created.' }
        format.json { render :json => @cotacao, :status => :created, :location => @cotacao }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cotacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT cotacaos/1
  # PUT cotacaos/1.json
  def update
    @cotacao = Cotacao.find(params[:id])

    respond_to do |format|
      if @cotacao.update_attributes(params[:cotacao])
        format.html { redirect_to @cotacao, :notice => 'Cotacao was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cotacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE cotacaos/1
  # DELETE cotacaos/1.json
  def destroy
    @cotacao = Cotacao.find(params[:id])
    @cotacao.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to cotacaos_path }
      format.json { head :ok }
    end
  end
end

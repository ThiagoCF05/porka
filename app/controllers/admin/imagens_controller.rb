class Admin::ImagensController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/imagens
  # GET admin/imagens.json
  def index
    @imagens = Imagem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @imagens }
    end
  end

  # GET admin/imagens/1
  # GET admin/imagens/1.json
  def show
    @imagem = Imagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @imagem }
    end
  end

  # GET admin/imagens/new
  # GET admin/imagens/new.json
  def new
    @imagem = Imagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @imagem }
    end
  end

  # GET admin/imagens/1/edit
  def edit
    @imagem = Imagem.find(params[:id])
  end

  # POST admin/imagens
  # POST admin/imagens.json
  def create
    @imagem = Imagem.new(params[:imagem])
		@imagem.imageble_type = 'Cooperativa'
		@imagem.imageble_id = Cooperativa.first

    respond_to do |format|
      if @imagem.save
        format.html { redirect_to [:admin, @imagem], :notice => 'Imagem was successfully created.' }
        format.json { render :json => @imagem, :status => :created, :location => @imagem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/imagens/1
  # PUT admin/imagens/1.json
  def update
    @imagem = Imagem.find(params[:id])

    respond_to do |format|
      if @imagem.update_attributes(params[:imagem])
        format.html { redirect_to [:admin, @imagem], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/imagens/1
  # DELETE admin/imagens/1.json
  def destroy
    @imagem = Imagem.find(params[:id])
    @imagem.destroy

    respond_to do |format|
      format.html { redirect_to admin_imagens_path }
      format.json { head :ok }
    end
  end
end

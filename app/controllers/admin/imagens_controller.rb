class Admin::ImagensController < Admin::ApplicationController
  before_filter :cooperativa_administrador_logado2

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

    if !params[:oferta_id].nil?
      session[:oferta_id] = params[:oferta_id]
    elsif !params[:produto_id].nil?
      session[:produto_id] = params[:produto_id]
    else
      session[:cooperativa_id] = params[:cooperativa_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @imagem }
    end
  end

  # POST admin/imagens
  # POST admin/imagens.json
  def create
    @imagem = Imagem.new(params[:imagem])

    if !session[:oferta_id].nil?
      @imagem.imageble_id = session[:oferta_id]
      @imagem.imageble_type = 'Oferta'
      session[:oferta_id] = nil
    elsif !session[:produto_id].nil?
      @imagem.imageble_id = session[:produto_id]
      @imagem.imageble_type = 'Produto'
      session[:produto_id] = nil
    else
      @imagem.imageble_id = session[:cooperativa_id]
      @imagem.imageble_type = 'Usuario'
      session[:cooperativa_id] = nil
    end

    respond_to do |format|
      if @imagem.save
        format.html { redirect_to [:admin, @imagem], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @imagem, :status => :created, :location => @imagem }
      else
        format.html { render :action => "new" }
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

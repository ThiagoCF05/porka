class CooperativasController < ApplicationController
  # GET cooperativas
  # GET cooperativas.json
  def index
    @cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao('Ativo')).paginate(:page => params[:page], :per_page => 24).order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cooperativas }
    end
  end

  # GET cooperativas/1
  # GET cooperativas/1.json
  def show
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cooperativa }
    end
  end

  def seleciona_categoria
    @cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao('Ativo')).paginate(:page => params[:page], :per_page => 24).order("created_at desc")
    @subcategorias = Subcategoria.where :categoria_id => Categoria.find(params[:categoria_id])
    
    respond_to do |format|
      format.html { render :action => "index"}
    end
  end
  
  def seleciona_subcategoria
    @cooperativas = []
    Produto.where(:subcategoria_id => Subcategoria.find(params[:subcategoria_id])).each do |produto|
      @cooperativas.push produto.cooperativa
    end
    
    respond_to do |format|
      format.html { render 'index.html.erb'}
    end
  end
  
  # GET cooperativas/new
  # GET cooperativas/new.json
  def new
    @cooperativa = Cooperativa.new    

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @cooperativa }
    end
  end

  # GET cooperativas/1/edit
  def edit
    @cooperativa = Cooperativa.find(params[:id])
  end

  # POST cooperativas
  # POST cooperativas.json
  def create
    @cooperativa = Cooperativa.new(params[:cooperativa])

    respond_to do |format|
      if @cooperativa.save
        format.html { redirect_to @cooperativa, :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @cooperativa, :status => :created, :location => @cooperativa }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT cooperativas/1
  # PUT cooperativas/1.json
  def update
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      if @cooperativa.update_attributes(params[:cooperativa])
        format.html { redirect_to @cooperativa, :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE cooperativas/1
  # DELETE cooperativas/1.json
  def destroy
    @cooperativa = Cooperativa.find(params[:id])
    @cooperativa.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to cooperativas_path }
      format.json { head :ok }
    end
  end
end

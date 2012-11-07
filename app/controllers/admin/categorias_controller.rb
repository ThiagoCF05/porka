class Admin::CategoriasController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/categorias
  # GET admin/categorias.json
  def index
    @categorias = Categoria.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @categorias }
    end
  end

  # GET admin/categorias/1
  # GET admin/categorias/1.json
  def show
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @categoria }
    end
  end

  # GET admin/categorias/new
  # GET admin/categorias/new.json
  def new
    @categoria = Categoria.new
    @categoria.status = Status.find_by_descricao('Ativo')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @categoria }
    end
  end

  # GET admin/categorias/1/edit
  def edit
    @categoria = Categoria.find(params[:id])
  end

  # POST admin/categorias
  # POST admin/categorias.json
  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to [:admin, @categoria], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @categoria, :status => :created, :location => @categoria }
      else
        format.html { render :action => "new" }
        format.json { render :json => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/categorias/1
  # PUT admin/categorias/1.json
  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        format.html { redirect_to [:admin, @categoria], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/categorias/1
  # DELETE admin/categorias/1.json
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_categorias_path }
      format.json { head :ok }
    end
  end
end

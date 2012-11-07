class Admin::SubcategoriasController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/subcategorias
  # GET admin/subcategorias.json
  def index
    @subcategorias = Subcategoria.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subcategorias }
    end
  end

  # GET admin/subcategorias/1
  # GET admin/subcategorias/1.json
  def show
    @subcategoria = Subcategoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @subcategoria }
    end
  end

  # GET admin/subcategorias/new
  # GET admin/subcategorias/new.json
  def new
    @subcategoria = Subcategoria.new
    @subcategoria.status = Status.find_by_descricao('Ativo')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subcategoria }
    end
  end

  # GET admin/subcategorias/1/edit
  def edit
    @subcategoria = Subcategoria.find(params[:id])
  end

  # POST admin/subcategorias
  # POST admin/subcategorias.json
  def create
    @subcategoria = Subcategoria.new(params[:subcategoria])

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to [:admin, @subcategoria], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @subcategoria, :status => :created, :location => @subcategoria }
      else
        format.html { render :action => "new" }
        format.json { render :json => @subcategoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/subcategorias/1
  # PUT admin/subcategorias/1.json
  def update
    @subcategoria = Subcategoria.find(params[:id])

    respond_to do |format|
      if @subcategoria.update_attributes(params[:subcategoria])
        format.html { redirect_to [:admin, @subcategoria], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subcategoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/subcategorias/1
  # DELETE admin/subcategorias/1.json
  def destroy
    @subcategoria = Subcategoria.find(params[:id])
    @subcategoria.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_subcategorias_path }
      format.json { head :ok }
    end
  end
end

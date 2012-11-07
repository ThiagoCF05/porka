class Admin::ProdutosController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/produtos
  # GET admin/produtos.json
  def index
    @produtos = Produto.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @produtos }
    end
  end

  # GET admin/produtos/1
  # GET admin/produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @produto }
    end
  end

  # GET admin/produtos/new
  # GET admin/produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @produto }
    end
  end

  # GET admin/produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST admin/produtos
  # POST admin/produtos.json
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to [:admin, @produto], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @produto, :status => :created, :location => @produto }
      else
        format.html { render :action => "new" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/produtos/1
  # PUT admin/produtos/1.json
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to [:admin, @produto], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/produtos/1
  # DELETE admin/produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_produtos_path }
      format.json { head :ok }
    end
  end
end

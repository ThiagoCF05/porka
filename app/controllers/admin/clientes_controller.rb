class Admin::ClientesController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/clientes
  # GET admin/clientes.json
  def index
    @clientes = Cliente.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clientes }
    end
  end

  # GET admin/clientes/1
  # GET admin/clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cliente }
    end
  end

  # GET admin/clientes/new
  # GET admin/clientes/new.json
  def new
    @cliente = Cliente.new
    @cliente.status = Status.first

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cliente }
    end
  end

  # GET admin/clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST admin/clientes
  # POST admin/clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to [:admin, @cliente], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @cliente, :status => :created, :location => @cliente }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/clientes/1
  # PUT admin/clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to [:admin, @cliente], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/clientes/1
  # DELETE admin/clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_clientes_path }
      format.json { head :ok }
    end
  end
end

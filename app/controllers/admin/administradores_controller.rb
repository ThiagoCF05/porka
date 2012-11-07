class Admin::AdministradoresController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/administradores
  # GET admin/administradores.json
  def index
    @administradores = Administrador.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @administradores }
    end
  end

  # GET admin/administradores/1
  # GET admin/administradores/1.json
  def show
    @administrador = Administrador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @administrador }
    end
  end

  # GET admin/administradores/new
  # GET admin/administradores/new.json
  def new
    @administrador = Administrador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @administrador }
    end
  end

  # GET admin/administradores/1/edit
  def edit
    @administrador = Administrador.find(params[:id])
  end

  # POST admin/administradores
  # POST admin/administradores.json
  def create
    @administrador = Administrador.new(params[:administrador])

    respond_to do |format|
      if @administrador.save
        format.html { redirect_to [:admin, @administrador], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @administrador, :status => :created, :location => @administrador }
      else
        format.html { render :action => "new" }
        format.json { render :json => @administrador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/administradores/1
  # PUT admin/administradores/1.json
  def update
    @administrador = Administrador.find(params[:id])

    respond_to do |format|
      if @administrador.update_attributes(params[:administrador])
        format.html { redirect_to [:admin, @administrador], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @administrador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/administradores/1
  # DELETE admin/administradores/1.json
  def destroy
    @administrador = Administrador.find(params[:id])
    @administrador.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_administradores_path }
      format.json { head :ok }
    end
  end
end

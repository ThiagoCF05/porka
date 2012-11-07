class Admin::UsuariosController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/usuarios
  # GET admin/usuarios.json
  def index
    @usuarios = Usuario.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuarios }
    end
  end

  # GET admin/usuarios/1
  # GET admin/usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usuario }
    end
  end

  # GET admin/usuarios/new
  # GET admin/usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usuario }
    end
  end

  # GET admin/usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST admin/usuarios
  # POST admin/usuarios.json
  def create
    if params[:admin] == 'admin'
      @usuario = Administrador.new(params[:usuario])
    else
      @usuario = Cooperativa.new(params[:usuario])
    end

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to [:admin, @usuario], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/usuarios/1
  # PUT admin/usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to [:admin, @usuario], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/usuarios/1
  # DELETE admin/usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_usuarios_path }
      format.json { head :ok }
    end
  end
end

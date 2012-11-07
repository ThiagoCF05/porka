class Admin::CooperativasController < Admin::ApplicationController
  before_filter :administrador_logado

  # GET admin/cooperativas
  # GET admin/cooperativas.json
  def index
    @cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao('Ativo'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cooperativas }
    end
  end

  # GET admin/cooperativas/1
  # GET admin/cooperativas/1.json
  def show
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cooperativa }
    end
  end

  # GET admin/cooperativas/new
  # GET admin/cooperativas/new.json
  def new
    @cooperativa = Cooperativa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cooperativa }
    end
  end

  # GET admin/cooperativas/1/edit
  def edit
    @cooperativa = Cooperativa.find(params[:id])
  end

  # POST admin/cooperativas
  # POST admin/cooperativas.json
  def create
    @cooperativa = Cooperativa.new(params[:cooperativa])

    respond_to do |format|
      if @cooperativa.save
        format.html { redirect_to [:admin, @cooperativa], :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @cooperativa, :status => :created, :location => @cooperativa }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT admin/cooperativas/1
  # PUT admin/cooperativas/1.json
  def update
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      if @cooperativa.update_attributes(params[:cooperativa])
        format.html { redirect_to [:admin, @cooperativa], :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE admin/cooperativas/1
  # DELETE admin/cooperativas/1.json
  def destroy
    @cooperativa = Cooperativa.find(params[:id])
    @cooperativa.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to admin_cooperativas_path }
      format.json { head :ok }
    end
  end
end

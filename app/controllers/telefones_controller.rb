class TelefonesController < ApplicationController
  # GET /telefones
  # GET /telefones.json
  def index
    @telefones = Telefone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @telefones }
    end
  end
  
  # GET /usuarios/{:id}/telefones
  # GET /usuarios/{:id}/telefones.json
  def indexUsuario
    @telefones = Telefone.where(:usuario => Usuario.find(params[:id]))
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @telefones }
    end
  end
  
   # GET /telefones/new
  # GET /telefones/new.json
  def new
    @telefone = Telefone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @telefone }
    end
  end
  
  # GET /telefones/newUsuario/{:id}
  # GET /telefones/newUsuario/{:id}.json
  def newUsuario
    @telefone = Telefone.new
    @telefone.telefonavel_id = params[:id]
    @telefone.telefonavel_type = 'Usuario'

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @telefone }
    end
  end
  
   # GET /telefones/newCliente
  # GET /telefones/newCliente.json
  def newCliente
    @telefone = Telefone.new
    @telefone.cooperativa = Cooperativa.find(params[:id])
    @telefone.telefonavel_id = params[:id]
    @telefone.telefonavel_type = 'Cliente'
    
    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @telefone }
    end
  end

  # GET /telefones/1/edit
  def edit
    @telefone = Telefone.find(params[:id])
  end

  # POST /telefones
  # POST /telefones.json
  def create
    @telefone = Telefone.new(params[:telefone])

    respond_to do |format|
      if @telefone.save
        if @telefone.telefonavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@telefone.telefonavel_id), :notice => 'Exemplo was successfully created.' }
          format.json { render :json => @telefone, :status => :created, :location => @telefone }
        else
          format.html { redirect_to Cliente.find(@telefone.telefonavel_id), :notice => 'Exemplo was successfully created.' }
          format.json { render :json => @telefone, :status => :created, :location => @telefone }
        end        
      else
        format.html { render :action => "new" }
        format.json { render :json => @telefone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /telefones/1
  # PUT /telefones/1.json
  def update
    @telefone = Telefone.find(params[:id])

    respond_to do |format|
      if @telefone.update_attributes(params[:telefone])
        if @telefone.telefonavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@telefone.telefonavel_id), :notice => 'Exemplo was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to Cliente.find(@telefone.telefonavel_id), :notice => 'Exemplo was successfully created.' }
          format.json { render :json => @telefone, :status => :created, :location => @telefone }
        end        
      else
        format.html { render :action => "edit" }
        format.json { render :json => @telefone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /telefones/1
  # DELETE /telefones/1.json
  def destroy
    @telefone = Telefone.find(params[:id])
    @telefonavel_type = @telefone.telefonavel_type
    @telefonavel_id = @telefone.telefonavel_id
    @telefone.destroy

    respond_to do |format|
        if @telefonavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@telefonavel_id), :notice => 'Exemplo was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to Cliente.find(@telefonavel_id), :notice => 'Exemplo was successfully created.' }
          format.json { head :ok }
        end  
    end
  end
end

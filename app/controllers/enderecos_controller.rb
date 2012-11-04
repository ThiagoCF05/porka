class EnderecosController < ApplicationController
  # GET /enderecos
  # GET /enderecos.json
  def index
    @telefones = Telefone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @telefones }
    end
  end

  # GET /usuarios/{:id}/enderecos
  # GET /usuarios/{:id}/enderecos.json
  def indexUsuario
    @enderecos = Endereco.where(:usuario => Usuario.find(params[:id]))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @enderecos }
    end
  end

   # GET /enderecos/new
  # GET /enderecos/new.json
  def new
    @endereco = Endereco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @endereco }
    end
  end

   # GET /enderecos/newUsuario/{:id}
  # GET /enderecos/newUsuario/{:id}.json
  def newUsuario
    @endereco = Endereco.new
    @endereco.enderecavel_id = params[:id]
    @endereco.enderecavel_type = 'Usuario'

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @endereco }
    end
  end

   # GET /enderecos/newCliente
  # GET /enderecos/newCliente.json
  def newCliente
    @endereco = Endereco.new
    @endereco.enderecavel_id = params[:id]
    @endereco.enderecavel_type = 'Cliente'

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @endereco }
    end
  end

  # GET /enderecos/1/edit
  def edit
    @endereco = Endereco.find(params[:id])
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(params[:endereco])

    respond_to do |format|
      if @endereco.save
        if @endereco.enderecavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@telefone.enderecavel_id), :notice => 'Exemplo was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to Cliente.find(@telefone.enderecavel_id), :notice => 'Exemplo was successfully created.' }
          format.json { render :json => @endereco, :status => :created, :location => @endereco }
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @endereco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /enderecos/1
  # PUT /enderecos/1.json
  def update
    @endereco = Endereco.find(params[:id])

    respond_to do |format|
      if @endereco.update_attributes(params[:endereco])
        if @endereco.enderecavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@endereco.enderecavel_id), :notice => 'Endereço was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to Cliente.find(@endereco.enderecavel_id), :notice => 'Endereço was successfully created.' }
          format.json { render :json => @endereco, :status => :created, :location => @endereco }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @endereco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco = Endereco.find(params[:id])
    @enderecavel_type = @endereco.enderecavel_type
    @enderecavel_id = @endereco.enderecavel_id
    @telefone.destroy

    respond_to do |format|
        if @enderecavel_type == 'Usuario'
          format.html { redirect_to Usuario.find(@enderecavel_id), :notice => 'Endereço was successfully updated.' }
          format.json { head :ok }
        else
          format.html { redirect_to Cliente.find(@enderecavel_id), :notice => 'Endereço was successfully created.' }
          format.json { head :ok }
        end
    end
  end
end

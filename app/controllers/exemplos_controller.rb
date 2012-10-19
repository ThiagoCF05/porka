class ExemplosController < ApplicationController
  # GET /exemplos
  # GET /exemplos.json
  def index
    @exemplos = Exemplo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @exemplos }
    end
  end

  # GET /exemplos/1
  # GET /exemplos/1.json
  def show
    @exemplo = Exemplo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @exemplo }
    end
  end

  # GET /exemplos/new
  # GET /exemplos/new.json
  def new
    @exemplo = Exemplo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @exemplo }
    end
  end

  # GET /exemplos/1/edit
  def edit
    @exemplo = Exemplo.find(params[:id])
  end

  # POST /exemplos
  # POST /exemplos.json
  def create
    @exemplo = Exemplo.new(params[:exemplo])

    respond_to do |format|
      if @exemplo.save
        format.html { redirect_to @exemplo, :notice => 'Exemplo was successfully created.' }
        format.json { render :json => @exemplo, :status => :created, :location => @exemplo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @exemplo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exemplos/1
  # PUT /exemplos/1.json
  def update
    @exemplo = Exemplo.find(params[:id])

    respond_to do |format|
      if @exemplo.update_attributes(params[:exemplo])
        format.html { redirect_to @exemplo, :notice => 'Exemplo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @exemplo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exemplos/1
  # DELETE /exemplos/1.json
  def destroy
    @exemplo = Exemplo.find(params[:id])
    @exemplo.destroy

    respond_to do |format|
      format.html { redirect_to exemplos_url }
      format.json { head :ok }
    end
  end
end

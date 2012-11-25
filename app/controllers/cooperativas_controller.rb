require 'will_paginate/array'

class CooperativasController < ApplicationController

  # GET cooperativas
  # GET cooperativas.json
  def index
      @cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao('Ativo'))

      #@cooperativas = []
      #if params[:subcategoria_id].nil?
      #@cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao#('Ativo')).paginate(:page => params[:page], :per_page => 24).order("#nome")
      #else
      #Produto.where(:subcategoria_id => Subcategoria.find(params[:subcategoria_id]), :status_id => Status.find_by_descricao('Ativo')).each do |produto|
      #        @cooperativas.push(produto.cooperativa)
      #end
      #@cooperativas = @cooperativas.paginate(:page => params[:page], :per_page => 24)
      #end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cooperativas }
    end
  end

  # GET cooperativas/1
  # GET cooperativas/1.json
  def show
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cooperativa }
    end
  end

  # GET cooperativas/new
  # GET cooperativas/new.json
  def new
    @cooperativa = Cooperativa.new

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @cooperativa }
    end
  end

  # GET cooperativas/1/edit
  def edit
    @cooperativa = Cooperativa.find(params[:id])
  end

  # POST cooperativas
  # POST cooperativas.json
  def create
    @cooperativa = Cooperativa.new(params[:cooperativa])
    @cooperativa.status = Status.first

    respond_to do |format|
      if @cooperativa.save
        format.html { redirect_to @cooperativa, :notice => 'Cooperativa was successfully created.' }
        format.json { render :json => @cooperativa, :status => :created, :location => @cooperativa }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT cooperativas/1
  # PUT cooperativas/1.json
  def update
    @cooperativa = Cooperativa.find(params[:id])

    respond_to do |format|
      if @cooperativa.update_attributes(params[:cooperativa])
        format.html { redirect_to @cooperativa, :notice => 'Cooperativa was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cooperativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE cooperativas/1
  # DELETE cooperativas/1.json
  def destroy
    @cooperativa = Cooperativa.find(params[:id])
    @cooperativa.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to cooperativas_path }
      format.json { head :ok }
    end
  end
end

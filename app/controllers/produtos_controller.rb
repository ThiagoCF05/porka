require 'will_paginate/array'

class ProdutosController < ApplicationController
  # GET produtos
  # GET produtos.json
  def index
    @produtos = []
    if params[:cooperativa_id].nil?
      @produtos = Produto.where(:status_id => Status.find_by_descricao('Ativo')).paginate(:page => params[:page], :per_page => 24).order("nome")
    else
      Produto.where(:cooperativa_id => Cooperativa.find(params[:cooperativa_id]), :status_id => Status.find_by_descricao('Ativo')).each do |produto|
        @produto.push(produto.cooperativa)
      end
      @produtos_aux = Produto.where(:cooperativa_id => Cooperativa.find(params[:cooperativa_id]), :status_id => Status.find_by_descricao('Ativo'))
      @produtos = @produtos_aux.paginate(:page => params[:page], :per_page => 24)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @produtos }
    end
  end

  # GET produtos/1
  # GET produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @produto }
    end
  end

  # GET produtos/new
  # GET produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html { render :action => "new" }
      format.json { render :json => @produto }
    end
  end

  # GET produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST produtos
  # POST produtos.json
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, :notice => 'Cooperativa was successfully created.' }
        format.json { render :json => @produto, :status => :created, :location => @cooperativa }
      else
        format.html { render :action => "new" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT produtos/1
  # PUT produtos/1.json
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to @produto, :notice => 'Cooperativa was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE produtos/1
  # DELETE produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.update_attributes :status => Status.find_by_descricao('Inativo')

    respond_to do |format|
      format.html { redirect_to produtos_path }
      format.json { head :ok }
    end
  end
end

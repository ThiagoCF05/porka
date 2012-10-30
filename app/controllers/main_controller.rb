class MainController < ApplicationController
  
  # GET /index
  # GET /index.json
  def index
    @ofertas = self.getOfertas
    @destaque = self.getDestaque
    @cooperativas = self.getCooperativas
    
    respond_to do |format|
      format.html # index.html.erb
      #format.json { header : ok }
    end
  end
  
  def getCooperativas
    @coopertativas = Cooperativa.all.shuffle
    @cooperativas = @cooperativas[0..5]
    return @cooperativas
  end
  
  def getOfertas
    @ofertas = Oferta.order("created_at desc").limit(10)
    return @ofertas
  end
  
  def getDestaque
    @destaque = Destaque.order("created_at desc").limit(10)
  end
end

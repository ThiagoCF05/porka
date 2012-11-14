class MainController < ApplicationController

  # GET /index
  # GET /index.json
  def index
    @ofertas = self.getOfertas
    @oferta = self.getDestaque.oferta
    @cooperativas = self.getCooperativas

    respond_to do |format|
      format.html # index.html.erb
      #format.json { header : ok }

    def getCooperativas
        @cooperativas = Cooperativa.where(:status_id => Status.find_by_descricao('Ativo')).shuffle
        @cooperativas = @cooperativas[0..5]
        return @cooperativas
    end

    def getOfertas
        @ofertas = Oferta.order("created_at desc").limit(10)
        return @ofertas
    end

    def getOfertaDestaque
        @oferta = Destaque.order("created_at desc").limit(1)[0].oferta
        return @oferta
>>>>>>> d3711bef9a902576c7ac0bc4f6a488bbd4746ae1
    end
end

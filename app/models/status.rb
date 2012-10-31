class Status < ActiveRecord::Base
  has_one :usuario
  has_one :cliente
  has_one :cotacao
  has_one :categoria
  has_one :oferta
  has_one :pagamento
  has_one :produto
  has_one :subcategoria
end

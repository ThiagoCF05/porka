class Cotacao < ActiveRecord::Base
  belongs_to :cooperativa_usuaria, :class_name => "CooperativaUsuaria"
  belongs_to :oferta
end

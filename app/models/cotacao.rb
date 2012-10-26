class Cotacao < ActiveRecord::Base
  belongs_to :cooperativa, :class_name => "Cooperativa", 
    :foreign_key => "cooperativa_id"
  belongs_to :oferta
end

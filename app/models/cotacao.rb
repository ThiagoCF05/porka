class Cotacao < ActiveRecord::Base
  belongs_to :cooperativa, :class_name => "Cooperativa",
    :foreign_key => "cooperativa_id"
  has_one :oferta
  belongs_to :status
end

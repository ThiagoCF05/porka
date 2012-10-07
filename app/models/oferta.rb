class Oferta < ActiveRecord::Base
  has_many :pagamentos 
  belongs_to :administrador, :class_name => "Administrador"
  has_one :cotacao
end

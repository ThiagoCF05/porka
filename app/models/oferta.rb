class Oferta < ActiveRecord::Base
  has_many :pagamentos 
  belongs_to :administrador, :class_name => "Administrador", 
    :foreign_key => "administrador_id"
  has_one :cotacao
  has_many :destaques
end

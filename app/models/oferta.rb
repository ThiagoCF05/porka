class Oferta < ActiveRecord::Base
  has_many :pagamentos 
  belongs_to :administrador, :class_name => "Administrador", 
    :foreign_key => "administrador_id"
  belongs_to :cotacao
  has_many :destaques
  belongs_to :status
end

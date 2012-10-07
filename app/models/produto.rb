class Produto < ActiveRecord::Base
  belongs_to :cooperativa
  belongs_to :cooperativa_usuaria, :class_name => "CooperativaUsuaria", 
    :foreign_key => "usuario_id"
  belongs_to :subcategoria
end

class Produto < ActiveRecord::Base
  belongs_to :cooperativa, :class_name => "Cooperativa", 
    :foreign_key => "cooperativa_id"
  belongs_to :subcategoria
end

class Produto < ActiveRecord::Base
  belongs_to :cooperativa, :class_name => "Cooperativa",
    :foreign_key => "cooperativa_id"
  belongs_to :subcategoria
  belongs_to :status
  has_many :imagens, :as => :imageble
end

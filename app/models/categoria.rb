class Categoria < ActiveRecord::Base
  has_many :subcategorias
  belongs_to :status
end

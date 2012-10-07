class Categoria < ActiveRecord::Base
  has_many :subcategoria
end

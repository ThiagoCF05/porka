class Subcategoria < ActiveRecord::Base
  belongs_to :categoria
  has_many :produtos
end

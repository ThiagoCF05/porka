class Subcategoria < ActiveRecord::Base
  belongs_to :categoria
  has_many :produtos
  belongs_to :status
end

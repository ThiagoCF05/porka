class Telefone < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :cooperativa
end

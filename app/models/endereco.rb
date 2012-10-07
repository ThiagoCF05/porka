class Endereco < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :usuario
  belongs_to :cooperativa
end

class Usuario < ActiveRecord::Base
  has_many :enderecos
  has_many :telefones
  has_many :log_acessos
end

class Usuario < ActiveRecord::Base
  has_many :enderecos, :as => :enderecavel
  has_many :telefones, :as => :telefonavel
  has_many :imagens, :as => :imageble
  has_many :log_acessos
  belongs_to :status
end

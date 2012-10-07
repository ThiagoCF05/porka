class Cidade < ActiveRecord::Base
  has_many :enderecos
  belongs_to :estado
end

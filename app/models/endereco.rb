class Endereco < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :enderecavel, :polymorphic => true
end

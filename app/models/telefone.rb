class Telefone < ActiveRecord::Base
  belongs_to :telefonavel, :polymorphic => true
end

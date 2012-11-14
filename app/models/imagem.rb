class Imagem < ActiveRecord::Base
  belongs_to :imageble, :polymorphic => true
end

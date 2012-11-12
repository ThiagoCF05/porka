class Imagem < ActiveRecord::Base
  belongs_to :imageble, :polymorphic => true

  attr_accessible :imagem
  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

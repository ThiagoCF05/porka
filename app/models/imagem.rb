class Imagem < ActiveRecord::Base
  belongs_to :imageble, :polymorphic => true

  attr_accessible :imagem
  has_attached_file :imagem, :styles => {:thumb=> "100x100#", :small  => "150x150>", :medium => "260x193>", :large =>   "465x300>" }
end

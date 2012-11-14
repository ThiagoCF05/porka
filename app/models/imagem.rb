class Imagem < ActiveRecord::Base
  belongs_to :imageble, :polymorphic => true

  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "465x300>", :thumb => "260x193>" }
end

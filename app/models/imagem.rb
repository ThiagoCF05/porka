class Imagem < ActiveRecord::Base
  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

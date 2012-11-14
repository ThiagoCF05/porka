class Cooperativa < Usuario
  has_many :produtos
  has_many :imagens, :as => :imageble
end

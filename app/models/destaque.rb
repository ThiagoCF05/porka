class Destaque < ActiveRecord::Base
  belongs_to :oferta
  belongs_to :status
  has_many :imagens, :as => :imageble
end

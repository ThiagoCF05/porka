class Destaque < ActiveRecord::Base
  belongs_to :oferta
  belongs_to :status
end

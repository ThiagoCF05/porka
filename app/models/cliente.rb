class Cliente < ActiveRecord::Base
  has_many :pagamentos
  belongs_to :status
  has_many :imagens, :as => :imageble
end

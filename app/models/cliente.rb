class Cliente < ActiveRecord::Base
  has_many :pagamentos
  belongs_to :status
end

class Cliente < ActiveRecord::Base
  has_many :pagamentos
end

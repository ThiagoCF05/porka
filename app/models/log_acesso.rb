class LogAcesso < ActiveRecord::Base
  belongs_to :usuario
  has_many :pagamentos
end

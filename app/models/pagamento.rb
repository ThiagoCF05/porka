class Pagamento < ActiveRecord::Base
  belongs_to :cliente, :class_name => "Cliente"
  belongs_to :oferta
  belongs_to :status
end

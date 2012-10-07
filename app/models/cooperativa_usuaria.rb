class CooperativaUsuaria < Usuario
  has_many :cotacaos
  has_many :produtos  
end

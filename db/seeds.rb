# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

status = Status.create :codigo => 'A', :descricao => 'Ativo'
Status.create :codigo => 'A1', :descricao => 'Aprovado'
Status.create :codigo => 'I', :descricao => 'Inativo'

cliente = Cliente.create :nome => "Thiago Castro Ferreira", :senha => "123456",
  :username => "thcasfe", :email => "thiago.castro.ferreira@gmail.com",
  :tipo_pessoa => "F", :documento => "466605845", :sexo => "M", :status_id => status
  
cooperativa = Cooperativa.create :nome => "Cooperativa de Teste",
  :senha => "123456", :username => "teste", :email => "teste@teste.com.br",
  :tipo_pessoa => "F", :documento => 466605845, :status_id => status

  telefone = Telefone.create :telefonavel_id => cooperativa, :ddd => 11, :numero => 985616083
  
  estado = Estado.create :nome => "SP"
  
  cidade = Cidade.create :nome => "São Paulo", :estado_id => estado
  
  endereco = Endereco.create :enderecavel_id => cooperativa, :rua => "Rua Marquês de Pombal",
  :bairro => "Vila Maria Alta", :cep => 02126070, :numero => 271, :cidade_id => cidade
  
  cooperativa = Cooperativa.create :nome => "Cooperativa de Teste", 
    :email => "teste@teste.com.br", :tipo_pessoa => "F", :status_id => status
    
  categoria = Categoria.create :nome => "Gastronômico", :descricao => "Teste", :status_id => status
  
  subcategoria = Subcategoria.create :nome => "Gastronômicos Doces", :descricao => "Teste", 
  :status_id => status, :categoria_id => categoria
  
  subcategoria = Subcategoria.create :nome => "Gastronômicos Regionais", :descricao => "Teste",
  :status_id => status, :categoria_id => categoria
  
  produto = Produto.create :nome => "Goiabada Cascão de Monte Alto", 
    :descricao => "A mais deliciosa goiabada cascão da região, agora vendida na web!",
    :status_id => status, :subcategoria_id => Subcategoria.find(2), :cooperativa_id => Cooperativa.find(2)

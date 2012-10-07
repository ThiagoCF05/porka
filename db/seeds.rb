# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

usuario_cliente = Cliente.create :nome => "Thiago Castro Ferreira", :senha => "123456",
  :username => "thcasfe", :email => "thiago.castro.ferreira@gmail.com",
  :tipo_pessoa => "F", :documento => "466605845", :sexo => "M", :status => "A"
  
usuario_cooperativa = CooperativaUsuaria.create :nome => "Cooperativa de Teste",
  :senha => "123456", :username => "teste", :email => "teste@teste.com.br",
  :tipo_pessoa => "F", :documento => 466605845, :status => "A"

  telefone = Telefone.create :usuario_id => usuario_cooperativa, :ddd => 11, :numero => 985616083
  
  endereco = Endereco.create :usuario_id => usuario_cooperativa, :rua => "Rua Marquês de Pombal",
  :bairro => "Vila Maria Alta", :cep => 02126070, :numero => 271
  
  cooperativa = Cooperativa.create :nome => "Cooperativa de Teste", 
    :email => "teste@teste.com.br", :tipo_pessoa => "F", :status => "A"
    
  categoria = Categoria.create :nome => "Gastronômico", :descricao => "Teste", :status => "A"
  
  subcategoria = Subcategoria.create :nome => "Gastronômicos Doces", :descricao => "Teste", 
  :status => "A", :categoria_id => categoria
  
  subcategoria = Subcategoria.create :nome => "Gastronômicos Regionais", :descricao => "Teste",
  :status => "A", :categoria_id => categoria
  
  produto = Produto.create :nome => "Goiabada Cascão de Monte Alto", 
    :descricao => "A mais deliciosa goiabada cascão da região, agora vendida na web!",
    :status => "A", :subcategoria_id => Subcategoria.find(2), :usuario_id => Usuario.find(2)

# Be sure to restart your server when you modify this file.

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'administrador', 'administradores'
  inflect.irregular 'imagem', 'imagens'
  inflect.irregular 'oferta', 'ofertas'
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'subcategoria', 'subcategorias'
end

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

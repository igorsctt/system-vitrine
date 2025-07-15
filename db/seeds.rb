# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Iniciando seed do banco de dados..."

# Criar usuário administrador
admin = User.find_or_create_by!(email: "admin@vitrineleide.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
  user.role = "admin"
end

puts "✅ Usuário administrador criado: #{admin.email}"

# Criar categorias
categories_data = [
  "Maquiagem",
  "Cuidados com a Pele",
  "Perfumes",
  "Cabelos",
  "Unhas",
  "Acessórios"
]

categories = categories_data.map do |name|
  Category.find_or_create_by!(name: name)
end

puts "✅ #{categories.count} categorias criadas"

# Criar produtos de exemplo
products_data = [
  {
    name: "Base Líquida Matte",
    description: "Base líquida com acabamento matte, longa duração e cobertura total. Ideal para todos os tipos de pele.",
    category: "Maquiagem",
    active: true
  },
  {
    name: "Paleta de Sombras Nude",
    description: "Paleta com 12 tons neutros, perfeita para criar looks do dia a dia ou mais elaborados.",
    category: "Maquiagem",
    active: true
  },
  {
    name: "Hidratante Facial Anti-idade",
    description: "Creme hidratante com ativos anti-idade, deixa a pele mais firme e hidratada.",
    category: "Cuidados com a Pele",
    active: true
  },
  {
    name: "Perfume Floral Feminino",
    description: "Fragrância delicada com notas florais, perfeita para o dia a dia.",
    category: "Perfumes",
    active: true
  },
  {
    name: "Shampoo Nutritivo",
    description: "Shampoo que nutre e fortalece os fios, deixando os cabelos sedosos e brilhantes.",
    category: "Cabelos",
    active: true
  },
  {
    name: "Esmalte Gel Premium",
    description: "Esmalte com efeito gel, longa duração e cores vibrantes.",
    category: "Unhas",
    active: false
  }
]

products_data.each do |product_data|
  category = Category.find_by!(name: product_data[:category])
  
  Product.find_or_create_by!(name: product_data[:name]) do |product|
    product.description = product_data[:description]
    product.category = category
    product.active = product_data[:active]
  end
end

puts "✅ #{products_data.count} produtos criados"

puts "🎉 Seed concluído com sucesso!"
puts "📧 Login: admin@vitrineleide.com"
puts "🔑 Senha: password123"

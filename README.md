# Vitrine Leide

## Descrição

**Vitrine Leide** é uma aplicação web de catálogo digital desenvolvida para a profissional de beleza Leide. O objetivo principal é exibir os produtos que ela vende de forma profissional e organizada, servindo como uma vitrine online. A aplicação não processa pagamentos ou gerencia carrinhos de compra; em vez disso, ela atua como um canal de prospecção, direcionando o cliente interessado para iniciar uma conversa de compra diretamente no WhatsApp da administradora.

## Funcionalidades

### Para Visitantes/Clientes
- ✅ Visualizar catálogo de produtos públicos
- ✅ Filtrar produtos por categoria
- ✅ Ver detalhes de cada produto
- ✅ Botão "Comprar pelo WhatsApp" com mensagem pré-preenchida
- ✅ Layout responsivo (mobile/desktop)

### Para Administradores
- ✅ Dashboard com estatísticas do sistema
- ✅ CRUD completo de categorias
- ✅ CRUD completo de produtos
- ✅ Upload de imagens com Cloudinary
- ✅ Controle de status ativo/inativo dos produtos
- ✅ Autenticação segura

## Stack Tecnológica

- **Backend:** Ruby 3.4.4 / Ruby on Rails 8.0.2
- **Banco de Dados:** PostgreSQL
- **Autenticação:** Devise
- **Upload de Imagens:** Cloudinary
- **Frontend:** Bootstrap 5.3 + SCSS
- **Hospedagem:** Configurado para Render (Free Tier)

## Instalação e Configuração

### Pré-requisitos
- Ruby 3.4.4
- Rails 8.0.2
- PostgreSQL
- Bundler

### 1. Clone o repositório
```bash
git clone <repository-url>
cd vitrine-system
```

### 2. Instale as dependências
```bash
bundle install
```

### 3. Configure o banco de dados
```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### 4. Configure as credenciais do Cloudinary
```bash
bundle exec rails credentials:edit
```

Adicione suas credenciais do Cloudinary:
```yaml
cloudinary:
  cloud_name: your_cloud_name
  api_key: your_api_key
  api_secret: your_api_secret
```

### 5. Execute a aplicação
```bash
bundle exec rails server
```

A aplicação estará disponível em `http://localhost:3000`

## Credenciais de Acesso

### Administrador
- **Email:** admin@vitrineleide.com
- **Senha:** password123

## Estrutura do Projeto

### Models
- **User:** Gerencia usuários do sistema (admin/editor)
- **Category:** Gerencia categorias de produtos
- **Product:** Gerencia produtos com imagens

### Controllers

#### Públicos
- **HomeController:** Página inicial com produtos em destaque
- **ProductsController:** Catálogo público de produtos

#### Administrativos
- **Admin::DashboardController:** Dashboard com estatísticas
- **Admin::CategoriesController:** CRUD de categorias
- **Admin::ProductsController:** CRUD de produtos

### Views
- Layout público responsivo com Bootstrap
- Layout administrativo com sidebar
- Views otimizadas para SEO
- Integração com WhatsApp

## Deployment

### Render (Recomendado)
1. Configure as variáveis de ambiente no Render
2. Configure o banco PostgreSQL
3. Configure as credenciais do Cloudinary
4. Deploy automático via Git

### Variáveis de Ambiente Necessárias
```
RAILS_MASTER_KEY=<sua_master_key>
DATABASE_URL=<postgresql_url>
```

## Funcionalidades Técnicas

### Validações
- Produtos devem ter nome, descrição, categoria e status
- Categorias devem ter nome único
- Upload de imagens otimizado

### Scopes e Queries
- Produtos ativos/inativos
- Categorias com produtos
- Produtos por categoria
- Otimização com `includes` para evitar N+1

### Security
- Autenticação obrigatória para área admin
- Verificação de role de administrador
- CSRF protection
- Sanitização de parâmetros

## Customização

### Configurando WhatsApp
Edite o número do WhatsApp em `app/views/home/index.html.erb`:
```erb
<%= link_to "https://wa.me/5511999999999?text=Olá! Gostaria de saber mais sobre os produtos.", 
           target: "_blank", class: "btn btn-whatsapp btn-lg" do %>
```

### Personalizando Cores e Estilos
Edite `app/assets/stylesheets/application.scss` para personalizar:
- Cores da marca
- Gradientes
- Estilos dos cards
- Layout responsivo

## Suporte

Para dúvidas ou sugestões, entre em contato através do GitHub Issues.

## Licença

Este projeto é propriedade da Vitrine Leide. Todos os direitos reservados.

---

Desenvolvido com ❤️ para impulsionar negócios de beleza online.

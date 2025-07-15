<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Vitrine Leide - Copilot Instructions

Este é um projeto Ruby on Rails 8.0.2 para uma aplicação de catálogo digital de produtos de beleza.

## Stack Tecnológica
- Ruby 3.4.4
- Rails 8.0.2
- PostgreSQL
- Devise (autenticação)
- Cloudinary (upload de imagens)
- Bootstrap 5.3 + SCSS
- Active Storage

## Arquitetura
- MVC pattern com namespace admin
- Área pública para catálogo
- Área administrativa protegida
- Models: User, Category, Product
- WhatsApp integration para vendas

## Convenções do Projeto
- Use convenções Rails padrão
- Controllers administrativos herdam de Admin::BaseController
- Layout 'admin' para área administrativa
- Bootstrap classes para styling
- Validações em português
- Flash messages em português

## Regras de Negócio
- Produtos têm status ativo/inativo
- Apenas produtos ativos são exibidos publicamente
- Categorias não podem ser excluídas se tiverem produtos
- Upload de imagens via Cloudinary
- Integração com WhatsApp para vendas

## Padrões de Código
- Use helpers do Rails para formulários
- Inclua validações nos models
- Use scopes para queries comuns
- Otimize queries com includes
- Siga padrões de segurança Rails

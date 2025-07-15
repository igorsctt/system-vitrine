Rails.application.routes.draw do
  devise_for :users

  # Corrige erro de GET /users/sign_out redirecionando para a página inicial
  get '/users/sign_out', to: redirect('/'), as: :invalid_sign_out

  # Rota pública
  root "home#index"

  # Rotas públicas de produtos
  resources :products, only: [:index, :show] do
    collection do
      get :category, to: "products#index"
    end
  end

  # Área administrativa
  namespace :admin do
    root "dashboard#show"
    get "dashboard", to: "dashboard#show"

    resources :categories
    resources :products
  end

  # Ignora requisições para esse caminho estranho vindo do Chrome DevTools
  get '/.well-known/appspecific/com.chrome.devtools.json', to: proc { [204, {}, ['']] }

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files (comentado por enquanto)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

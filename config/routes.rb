Rails.application.routes.draw do
  
  root 'personas#index', as: 'personas_index'
  resources :personas

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

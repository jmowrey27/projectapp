Rails.application.routes.draw do
  
  devise_for :admins 
    
  root   'static_pages#home'
  get    'static_pages/home'
  get    '/help',              to: "static_pages#help"
  get    '/about',             to:  "static_pages#about"
  get    '/contact',           to: "static_pages#contact"
  get    '/pages',             to:  "pages#index"
  resources :pages

end

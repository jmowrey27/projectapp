Rails.application.routes.draw do
   mount Ckeditor::Engine => '/ckeditor'
   devise_for :admins
   namespace :admin do
     resources :categories
     resources :pages
     resources :menus
     resources :products
 
     get 'menus/index'
     get 'menus/new'
     get 'menus/create'
     get 'menus/update'
     get 'menus/edit'
     get 'menus/destroy'
   end
   resources :categories, only: [:show, :index]
   resources :pages, only: [:show]
   resources :products, only: [:show]
 
   root 'pages#show', id: Page.find_by(slug: 'home')&.id
   get '/about', to: 'pages#show', id: Page.find_by(slug: 'about')&.id, as: 'about'
   get '/pages/:id', to: 'pages#show', as: 'dynamic_page'
   get 'static_pages/home'
   get '/help', to: "static_pages#help"
   get '/contact', to: "static_pages#contact"
 
   get '/:slug', to: 'pages#show_by_slug', as: 'show_by_slug'

 end
 
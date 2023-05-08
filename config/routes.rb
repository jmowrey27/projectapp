Rails.application.routes.draw do
   mount Ckeditor::Engine => '/ckeditor'
   
   devise_scope :admin do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
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

   root 'pages#show', id: Page.find_by(slug: 'home')&.id
   get '/about',     to: 'pages#show', id: Page.find_by(slug: 'about')&.id, as: 'about'
   get '/pages/:id', to: 'pages#show', as: 'dynamic_page'
   get '/categories', to:'categories#index'
   get 'static_pages/home'
   get '/help',      to: "static_pages#help"
   get '/contact',     to: 'pages#show', id: Page.find_by(slug: 'contact')&.id, as: 'contact'
   get '/:slug', to: 'pages#show_by_slug', as: 'show_by_slug', constraints: ->(req) { req.path !~ /^\/(products|cart)$/ }
   get '/cart', to: 'order_items#index'
   get 'admin/home', to: 'pages#show', id: Page.find_by(slug: 'home')&.id
  #  get '/products', to: redirect('/admin/products')


   resources :categories, only: [:show, :index]
   resources :pages, only: [:show]
   resources :products, only: [:show, :index]
   resources :order_items, path: '/cart/items'
 end
 
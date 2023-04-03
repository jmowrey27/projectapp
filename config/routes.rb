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
   
  root   'admin/pages#show', id: Page.find_by(slug: 'home').id
  get    'static_pages/home'
  get    '/help',              to: "static_pages#help"
 # get    '/about',             to:  "static_pages#about"
  get '/about', to: 'pages#show', id: Page.find_by(slug: 'about').id
  get    '/contact',           to: "static_pages#contact"
  #get    '/pages',             to:  "pages#index"

  
  



 Page.where.not("slug", nil).all.each do |page|
    get "/#{page.slug}", controller: "pages", action: "show", id: page.id
 end

end

Rails.application.routes.draw do
  resources :pages, except: [:show]
  get "home/index"
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  # get 'production_companies/index'
  # get 'production_companies/show'
  # get 'movies/index'
  # get 'movies/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies, only: %i[index show]
  resources :production_companies, only: %i[index show]

  # default route to website aka home page route
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "books", to: "books#index"
  get "books/new", to: "books#new", as: :new_book
  get "books/:id/edit", to: "books#edit", as: :edit_book
  patch "books/:id", to: "books#update", as: :book_inventory
  delete "books/:id", to: "books#destroy"  
  get "books/:id", to: "books#show", as: :book 
  post "books", to: "books#create", as: :book_inventories
  # Defines the root path route ("/")
  root "books#index"
end

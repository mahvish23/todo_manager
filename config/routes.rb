Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "todos" => "todos#index"

  post "todos/create" => "todos#create"
  get "/", to: "home#index"
  patch "todos/update" => "todos#update"
  resources :users
end

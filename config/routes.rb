Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'search-mock' => 'search#index', :as => 'home'
  get 'search-mock/form' => 'search#form', :as => 'form'
  get 'search-mock/results/:document_type' => 'search#results', :as => 'results'
  get 'search-mock/objects' => 'search#object', :as => 'object'
end

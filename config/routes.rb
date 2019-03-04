Rails.application.routes.draw do
  resources :product_reviews
  root "main#home"
  get "products/all_report", to:"products#all_report", as: "all_report"
  get "search/search_result", to:"search#search_result", as: "search_result"
  get "products/thankyou", to: "products#thankyou", as: "thankyou"
  get "products/:id", to:"products#show", as: "product_show"
  get "search/advanced_search",to: "search#advanced_search", as:"advanced_search"
  post "search/advanced_search", to: "search#advanced_search_result"
  post "/process_payment", to: "products#process_payment", as: "payment"
  get "search/advance_search_result", to: "search#advance_search_result", as: "advance_search_result"
  # get "movies/new", to: "movies#new", as: 'new_movie'
  get "/businesses/:business_id/products/my_products", to: "products#history", as: "history"
  
  
  resources :businesses do
    resources :products do
      member do
        put "inactive", to: "products#inactive_button", as: "inactive"
      end
    end
  end
  devise_for :users, controllers:  { registrations: 'registrations' }
 
  get 'profile', to: 'main#show'
  post 'profile', to: 'main#update'

  get 'buy', to: 'transactions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
 
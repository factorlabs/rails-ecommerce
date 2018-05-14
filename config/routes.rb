Rails.application.routes.draw do
  get '/products/xls' => 'products#xls', as: :products_xls
  
  devise_for :users
  resources :tags
  resources :products
  resources :categories
  
  get '/:id', to: 'product#show', constraints: { id: /\d+/ }
  
  get '/orders/test' => 'orders#order', as: :order_test
end

Rails.application.routes.draw do
  get 'avatars/create'
  resources :items do
    resources :cat_images, only: [:create]
  end

  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

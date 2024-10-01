Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'dashboard#index'
  resources :shifts, param: :date
  resources :dogs
  put :bulk_update_dogs, to: 'dogs#bulk_update'
  get 'dashboard', to: 'dashboard#index'
  delete 'dog_shifts/:id', to: 'shifts#delete_dog', as: 'delete_dog_shift'
  devise_scope :user do
    post 'logout', to: 'users/sessions#destroy'
    authenticated :user do
      root to: redirect('/dashboard'), as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end
end

Rails.application.routes.draw do
  root 'tops#index'
  resources 'tweets' do
    collection do
      post :confirm
    end
  end
  resources "sessions", only: [:new, :create, :destroy]
  resources 'users'
  resources 'favorites', only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

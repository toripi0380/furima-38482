Rails.application.routes.draw do
  devise_for :users
   root to: "items#index"
   resources :items do
    resources :purchasers, onry: [:index, :new, :create]
   end
end

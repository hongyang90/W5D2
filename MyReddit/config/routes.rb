Rails.application.routes.draw do

    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :show]
    resources :subs do 
        resources :posts, only: [:create]
    end 
    resources :posts, except: [:index, :create]

    
end

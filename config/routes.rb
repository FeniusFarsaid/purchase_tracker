Rails.application.routes.draw do
  root to: 'application#welcome'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login', to: 'devise/sesssions#new'
  end
  
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end 

end

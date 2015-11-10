Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get '/search', to: "users#search", as: "search"
  # devise_scope :user do
  # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root 'users#index'

  


end

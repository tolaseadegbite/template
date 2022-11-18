Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.admin == true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_for :users, controllers: { registrations: "registrations" }

  resources :questionnaires do
    resources :responses
  end
  
  root to: 'questionnaires#index'

  get '/nd_i', to: 'questionnaires#ND_I'
  get '/nd_ii', to: 'questionnaires#ND_II'
  get '/hnd_i', to: 'questionnaires#HND_I'
  get '/hnd_ii', to: 'questionnaires#HND_II'
end

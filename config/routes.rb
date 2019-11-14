Rails.application.routes.draw do
  root 'departments#index'

  get 'about', to: 'departments#about'

  
  

  resources :departments do
    resources :topics
  end


end


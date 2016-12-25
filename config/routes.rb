Rails.application.routes.draw do
  root "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  

  shallow do
    resources :users, only: %i(new show create index) do
      resources :days, only: %i(index create show destroy) do
        resources :meals, only: %i(new show create index)
      end
      resources :foods  
    end
  end
end

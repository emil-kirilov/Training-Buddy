Rails.application.routes.draw do
  root "sessions#new"
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  

  shallow do
    resources :users, only: %i(new show create index) do
      resources :days, only: %i(index create) do
        resources :meals
      end
    end
  end
end

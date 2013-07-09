Profiles::Application.routes.draw do
  get '/user/:id' => "users#view", as: 'profile'
  get '/me' => 'users#me', as: 'my_profile'
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/user/:id/edit' => 'users#edit', as: :user_edit
end

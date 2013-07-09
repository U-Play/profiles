Profiles::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/user/:id' => "users#view", as: 'profile'

  scope '/me' do
    root to: 'users#me', as: :my_profile
    get '/edit' => 'users#edit', as: :edit_my_profile
  end

  root to: 'pages#home'

end

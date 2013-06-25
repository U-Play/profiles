Profiles::Application.routes.draw do
  get '/user/:id' => "users#view"
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace 'profiles' do
    get 'edit' => 'profiles#edit'
  end
end

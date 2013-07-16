Profiles::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/user/:id' => "users#view", as: 'profile'

  scope '/me' do
    root to: 'users#me', as: :my_profile
    get   '/edit' => 'users#edit', as: :edit_my_profile
    put   '/edit' => 'users#update', as: 'update_my_profile'
    get   '/experiences/new' => 'sport_experiences#new', as: 'add_my_sport_experience'
    post  '/experiences' => 'sport_experiences#create', as: 'create_my_sport_experience'
  end

  root to: 'pages#home'

end

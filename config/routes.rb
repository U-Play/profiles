Profiles::Application.routes.draw do
  devise_for :users, skip: [:registrations, :sessions], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/user/:id' => "users#view", as: 'profile'
  get '/referral/:token' => "pages#home", as: 'referral'

  scope '/me' do
    root to: 'users#me', as: :my_profile
    get   '/edit' => 'users#edit', as: :edit_my_profile
    put   '/:id' => 'users#update'

    resources :experiences, only: [:create, :edit, :update]
  end

  root to: 'pages#home'

end

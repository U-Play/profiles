Profiles::Application.routes.draw do
  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  devise_for :users, skip: [:registrations, :sessions], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/about' => 'pages#about', as: 'about'
  get '/user/:id' => "users#view", as: 'profile'
  get '/referral/:token' => "pages#home", as: 'referral'

  scope '/me' do
    root to: 'users#me', as: :my_profile
    get   '/edit' => 'users#edit', as: :edit_my_profile
    put   '/:id' => 'users#update'

    resources :teams, only: [:create, :edit, :update, :destroy]
  end

  get '/:username' => "users#view_by_username", as: 'username'

  root to: 'pages#home'
  get '/wip/:user_id' => 'pages#wip', as: :wip

end

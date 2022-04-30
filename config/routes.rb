Rails.application.routes.draw do
  resources :users
  post 'users/create'
  get 'users/:id/spendings' => 'users#spending'

  post 'spending/create'

end

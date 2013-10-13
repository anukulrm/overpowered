Api::Application.routes.draw do
  scope '/api' do
    resources :tasks
  end
  root to: 'home#index'

end

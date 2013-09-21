Api::Application.routes.draw do
  scope '/api' do
    get "/tasks(.:format)" => "tasks#index"
    get "/tasks/:id(.:format)" => "tasks#show"
  end
  root to: 'home#index'

end

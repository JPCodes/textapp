Rails.application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show]
  get '/response' => 'messages#reply'
  post '/response' => 'messages#reply'
end

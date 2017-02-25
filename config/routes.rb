Rails.application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show]
end

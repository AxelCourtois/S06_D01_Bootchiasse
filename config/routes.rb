Rails.application.routes.draw do

  root 'gossip#index'

  get 'team', to: 'public#team'
  get 'contact', to: 'public#contact'
  get 'welcome/:id', to: 'user#home'

  get 'gossip/:id', to: 'gossip#show'

  get 'user/:id', to: 'user#page'
  get 'user', to: 'user#new'
  post 'user', to: 'user#create'

end

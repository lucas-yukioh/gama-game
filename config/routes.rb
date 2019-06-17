Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing_page'

  get 'create_game', to: 'games#create_game'
  get ':id', to: 'games#show_game', as: :show_game
end

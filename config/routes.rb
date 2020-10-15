Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'gifs#index'

  resources(:gifs, only: %i[index new create])

  resources(:labels, only: %i[index new create])
end

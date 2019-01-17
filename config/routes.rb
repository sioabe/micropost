Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do     #URLを深掘りするオプション
      get :followings
      get :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  #課題　お気に入り機能
  #fav/unfavできるようにするルーティング
  resources :favorites, only: [:create, :destroy]
  #中間テーブルより先のお気に入りmicropost一覧を表示するためのルーティング
  resources :microposts, only: [:index, :show, :new, :create] do
    member do
      get 'likes', to: "micropost#favorite_microposts"
      get :favorite_users   #いらないかも
    end
  end
end

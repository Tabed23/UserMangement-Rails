Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'get_user', action: :getUsers, controller: :users
      put 'put_user', action: :updateUser, controller: :users
      post 'add_user', action: :addUser, controller: :users
      delete 'delete_user', action: :deleteUser, controller: :users
      get 'show_user', action: :showUser, controller: :users
    end
  end
end

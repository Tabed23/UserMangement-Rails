Rails.application.routes.draw do
  namespace :api do

    namespace :auth do
      post 'login', action: :login, controller: :auth
      post 'checktoken', action: :check_token, controller: :auth
    end

    namespace :v1 do
      get 'get_user', action: :getUsers, controller: :users
      put 'put_user', action: :updateUser, controller: :users
      post 'add_user', action: :addUser, controller: :users
      delete 'delete_user', action: :deleteUser, controller: :users
      get 'show_user', action: :showUser, controller: :users
    end

  end

end

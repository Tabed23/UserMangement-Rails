class Api::Auth::AuthController < ApplicationController
  def login

     user = User.find_by(:username => params[:username])

      if !user
        render json: {msg: 'user not found', user: user}, status: :unprocessable_entity
        return true;
      end

      if user.authenticate(params[:password])
        render json: {msg: 'Successfully logged in', user: user}, status: :ok
      else
        render json: {msg: 'password wrong'}, status: :unprocessable_entity
      end
  end

end

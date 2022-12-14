class Api::Auth::AuthController < ApplicationController
  def login

     user = User.find_by(:username => params[:username])

      if !user
        render json: {msg: 'user not found', user: user}, status: :unprocessable_entity
        return true;
      end

      if user.authenticate(params[:password])
        token = self.creat_token(user.id.to_s, user.username, user.type.to_s)
        user.set(:token => token)
        render json: {msg: 'Successfully logged in', user: user.as_json({ :except => [:password_digest]})}, status: :ok
      else
        render json: {msg: 'password wrong'}, status: :unprocessable_entity
      end
  end

  def check_token
    token = params[:token]
    self.creat_token(1, true, true);
  end

end

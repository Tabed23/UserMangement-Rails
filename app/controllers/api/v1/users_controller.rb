class Api::V1::UsersController < ApplicationController
  before_action :getUser, only: [:deleteUser, :updateUser, :showUser]

  before_action  only: [:updateUser, :deleteUser] do
    check_token
  end

  # get all users
   def getUsers
      user = User.all
      if user
        render json: user , status: :ok
      else
        render json:{msg:"user empty"}, status: :unprocessable_entity
      end
   end


  def addUser
      user = User.new(userprams)

      user.type = 2

      if  user.save()
        render json: user , status: :ok
      else

        render json: {msg: "error, user not created", error: user.errors}, status: :unprocessable_entity
      end
  end



  def showUser
      if @user
        render json: @user, status: :ok
      else
        render json: {msg:"user not found"}, status: :unprocessable_entity
      end
  end



  def deleteUser
      if @user
        if @user.destroy(userprams)
          render json: {msg: "delete user"}, status: :ok
        else
          render json: {msg:"delete failed"}, status: :unprocessable_entity
        end
      else
        render json: {msg:"user not found...!!"}, status: :unprocessable_entity
      end
  end




  def updateUser
    if @user
       if @user.update(userprams)
        render json: @user, status: :ok
       else
          render json: {msg:"update failed", error: user.errors}, status: :unprocessable_entity
       end
    else
      render json: {msg:"user not found...!!"}, status: :unprocessable_entity
    end
  end


  private
    def userprams
      params.permit(:username, :email, :password);
    end

    def getUser
      @user = User.find(params[:id])
    end


end

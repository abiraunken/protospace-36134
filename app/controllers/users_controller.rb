class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
     #@user= current_user.id
     @prototype = @user.prototypes
  end
end

class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show] 
  before_action :set_prototype, only: [:update,:destroy,:edit,:show]
  before_action :move_to_index, except: [:new,:create,:index, :show]

 def index
  @prototype=Prototype.all
end

def new
  @prototype=Prototype.new
end

def create
  @prototype=Prototype.new(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render :new
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment=Comment.new
  @comments=@prototype.comments.includes(:user)
end

def edit
  @prototype=Prototype.find(params[:id])
  unless user_signed_in?
    redirect_to action: :index
  end
end


def destroy
  @prototype=Prototype.find(params[:id])
  @prototype.destroy
  redirect_to root_path
end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
  redirect_to prototype_path(params[:id])
  else
    render :edit
end
end

def move_index
  unless user_signed_in?
    redirect_to action: :index
  else
      puts "こんにちは#{user_id}さん"
end
end

private
def  prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
end

def set_prototype
  @prototype = Prototype.find(params[:id])
end

def move_to_index
  if user_signed_in? && current_user.id != @prototype.user.id
    # 「もし投稿者とログインしているユーザーが違う場合」
    redirect_to action: :index
end
end
end
class PrototypesController < ApplicationController
  before_action :authenticate_user!,only: [:edit]
  
 def index
  @prototypes=Prototype.all
end

def new
  @prototypes=Prototype.new
end

def create
  @prototype=Prototype.new(prototype_params)
  if @prototype.save
    redirect_to  prototype_path(id: current_user)
  else
    render :new
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment=Comment.new
  @comments=Comment.all
end

def edit
  @prototype=Prototype.find(params[:id])
  redirect_to action: :index
end


def destroy
  @prototype=Prototype.find(params[:id])
  @prototype.destroy
  redirect_to root_path
end

def update
  @prototype=Prototype.find(params[:id])
  if @prototype.update(prototype_params)
  redirect_to root_path
  else
    render :show
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
end
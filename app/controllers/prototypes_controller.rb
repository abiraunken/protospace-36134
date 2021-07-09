class PrototypesController < ApplicationController
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
  @prototype=Prototype.find(Path[:id])
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
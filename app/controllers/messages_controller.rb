class MessagesController < ApplicationController

  before_action :move_to_index, except: [:index, :show] 

  def index
    @messages = Message.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(messages: message_params[:messages], user_id: current_user.id)
  end

  def destroy
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.destroy
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    if current_user.id == message.user_id
      message.update(message_params)
    end
  end

  private
  def message_params
    params.require(:message).permit(:messages)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

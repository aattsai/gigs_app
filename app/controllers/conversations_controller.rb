class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where(user: current_user)
  end
  
  def create
    @conversation = Conversation.new(performer: current_user, user: User.find(params[:user_id]))
    if @conversation.save 
      @messages = @conversation.messages
      render :show
    else
      redirect_to root_path
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  end
end
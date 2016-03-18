class MessagesController < ApplicationController

  def new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    if current_user.class == User 
      @message = Message.new(conversation: @conversation, user: current_user, content: params[:message][:content])
    elsif current_user.class == Performer
      @message = Message.new(conversation: @conversation, performer: current_user, content: params[:message][:content])
    end
    if @message.save
      render partial: 'message', locals: {message: @message}
    else
      render :show
    end
  end

end
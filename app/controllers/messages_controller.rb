class MessagesController < ApplicationController
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    @message = Message.new
  end

  def new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    if current_user.class == User 
      @message = Message.new(conversation: @conversation, user: current_user, content: params[:message][:content])
      PrivatePub.publish_to(conversation_messages_path(@conversation), "#{@message}")
      respond_to do |format|
        format.js 
      end
    elsif current_user.class == Performer
      @message = Message.new(conversation: @conversation, performer: current_user, content: params[:message][:content])
      PrivatePub.publish_to(conversation_messages_path(@conversation), "#{@message}")
      respond_to do |format|
        format.js 
      end
    end
    # if @message.save
    #   render partial: 'message', locals: {messages: @messages}
    # else
    #   render :show
    # end
  end
  

end
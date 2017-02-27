class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:reply]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
  @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
         format.html { redirect_to message_path(@message) }
         format.js
       end
      flash[:notice] = "Your message was sent!"
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def reply
    @output = {"Message" => "Message from Rails"}
    render :xml => @output.to_xml(:root => 'Response')
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

  # protected
  #
  # def xml_request?
  #    request.format.xml?
  # end
end

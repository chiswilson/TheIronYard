class SysMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sys_message, only: [:show, :edit, :update, :destroy]

  
  def index
    @sys_messages = SysMessage.all
  end

  def show
  end

  def new
    @sys_message = SysMessage.new
  end

  def edit
  end

  def create
    # puts(sys_message_params)

    # First, check to make Sure this contact is in this Account...
    contact = Contact.find(sys_message_params[:contact_id])
    if session[:acct_id] && (session[:acct_id] != 0) && (session[:acct_id] != contact.account_id)
      redirect_to root_path
      return
    end

    @sys_message = SysMessage.new(sys_message_params)
    @sys_message.from_account_id = session[:acct_id]
    @sys_message.from_user_id =    session[:user_id]
    @sys_message.attempts = 0

    # This sends the message to the Contact's device(s)   (this is in the model...)
    puts(ENV['my_mail_server'])
    @sys_message.send_message

    respond_to do |format|
      if @sys_message.save
        format.html { redirect_to root_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @sys_message }
      else
        format.html { render :new }
        format.json { render json: @sys_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # Probably not gonna call update or destroy ...
  def update
    respond_to do |format|
      if @sys_message.update(sys_message_params)
        format.html { redirect_to @sys_message, notice: 'Sys message was successfully updated.' }
        format.json { render :show, status: :ok, location: @sys_message }
      else
        format.html { render :edit }
        format.json { render json: @sys_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sys_message.destroy
    respond_to do |format|
      format.html { redirect_to sys_messages_url, notice: 'Sys message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# ***************************************************************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sys_message
      @sys_message = SysMessage.find(params[:id])
    end

    def sys_message_params
      params.require(:sys_message).permit(:id, :contact_id, :msg, :from_addr)
        # leaving out from_account_id and from_user_id cause those dont get sent in from the form
    end
end

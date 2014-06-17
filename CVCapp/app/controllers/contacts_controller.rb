class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_admin
  before_action :set_contact_and_checkid, only: [:show, :edit, :update, :destroy]
  # before_action :check_contact_id, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  def index
    if current_user.master_admin?
      @contacts = Contact.order(:name).where("name like ?", "%#{params[:term]}%")
    elsif current_user.admin? && (current_user.account)
      @contacts = current_user.account.contacts.order(:name).where("name like ?", "%#{params[:term]}%")
    else
      @contacts = []
    end

    respond_to do |format|
      format.html {  }
      format.json {         
        # render json: @contacts.to_json
        render json: @contacts.map{ |c| {label: c.name, id: c.id} } 
      }
    end
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    # force this contact to be in the same account as the current user is
    if session[:acct_id] > 0
      @contact.account_id = session[:acct_id]
    end

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_path, notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end

# ***********************************************************************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_and_checkid
      @contact = Contact.find(params[:id])
      if session[:acct_id] && (session[:acct_id] != 0) && (session[:acct_id] != @contact.account_id)
        redirect_to root_path
      end
    end

    def contact_params
      params.require(:contact).permit(:name, :account_id, :misc)
    end

    def check_for_admin
      if (not current_user.admin?) && (not current_user.master_admin?)
        redirect_to root_path
      end
    end
end

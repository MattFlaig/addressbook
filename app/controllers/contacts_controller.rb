class ContactsController < ApplicationController
  require 'pry'

  before_action :require_login
  #rails 4 "before_action" instead of "before_filter"

  def index
    @contacts = current_user.contacts
  end

  def show
  	@contact = current_user.contacts.find(params[:id])
  end

  def new
    @contact = current_user.contacts.build
  end
  
  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
    	flash[:notice] = "Contact was successfully created"
    	redirect_to contacts_path
    else
    	render "new"
    end
  end

  def edit
    @contact = current_user.contacts.find(params[:id])
  end

   def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update_attributes(contact_params)
    	flash[:notice] = "Contact was successfully updated"
    	redirect_to contacts_path
    else
    	render "edit"
    end
  end

  def destroy
  	@contact = current_user.contacts.find(params[:id])
  	@contact.destroy
  	redirect_to contacts_path
  end

  def search
    @results = Contact.search_by_name(params[:search_term])
  end

  private

  def contact_params
  	params.require(:contact).permit(:name, :email, :phonenumber, :city)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please sign in first!"
      redirect_to login_path
    end
  end

end

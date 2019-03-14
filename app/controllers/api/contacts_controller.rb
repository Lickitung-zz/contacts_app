class Api::ContactsController < ApplicationController
  def index
    if current_user
      @contacts = current_user.contacts
      render 'index.json.jbuilder'
    else
      render json: {message: "No contacts."}
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.email = params[:email] || @contact.email
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.bio = params[:bio] || @contact.bio
    @contact.save
    @contact.last_name = params[:last_name] || @contact.last_name
    if @contact.save
      render "show.json.jbuilder"
    else
      render "error.json.jbuilder"
    end
  end

  def create
    nothing = "nothing was entered here"
    @contact = Contact.new(
     first_name: params[:first_name] || nothing,
     middle_name: params[:middle_name] || nothing,
     phone_number: params[:phone_number] || nothing,
     email: params[:email] || nothing,
     user_id: params[:email]
    )
    @contact.last_name = params[:last_name] || nothing
    if @contact.save
      render "show.json.jbuilder"
    else
      render "error.json.jbuilder"
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact deleted."}
  end

  def test
    @contacts = Contact.find_by(id: params[:id])
    render "index.json.jbuilder"
  end
end

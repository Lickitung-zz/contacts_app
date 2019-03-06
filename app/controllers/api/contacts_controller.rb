class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.name = params[:name] || @contact.name
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.email = params[:email] || @contact.email
    @contact.save
    render 'show.json.jbuilder'
  end

  def create
    @nothing = "nothing was entered here"
    @contact = Contact.new(
     name: params[:name] || @nothing,
     phone_number: params[:phone_number] || @nothing,
     email: params[:email] || @nothing
    )
    @contact.save
    render 'show.json.jbuilder'
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

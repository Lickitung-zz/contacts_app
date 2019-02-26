class Api::ContactsController < ApplicationController
  def contact_list
    # get a contact from the db
    @contact1 = Contact.first
    render 'contact_display.json.jbuilder'
  end
end

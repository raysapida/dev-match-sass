class ContactsController < ApplicationController
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @contact = contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'contact was successfully created.'
        format.html { redirect_to(@contact) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comment)
  end
end

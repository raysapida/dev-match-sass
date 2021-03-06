class ContactsController < ApplicationController
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        ContactMailer.contact_email(name, email, body).deliver_later

        flash[:success] = 'Message sent.'
        format.html { redirect_to root_path }
      else
        flash[:danger] = 'Error occured, message has not been sent.'
        format.html { render action: 'new' }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comment)
  end
end

class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver
      flash[:notce] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end

  # def process_form
  #   message = "Received request from #{params[:contact][:name]}"
  #   redirect_to root_path, :notice => message
  # end
  #
end
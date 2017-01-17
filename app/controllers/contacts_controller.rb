class ContactsController < ApplicationController
    
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:body]
            
            ContactMailer.contact_email(name, email, body)
            flash[:success] = "Thank you, your message has been sent."
            redirect_to :back
        else
            flash[:danger] = "Error occured, please try again later."
            redirect_to :back
        end
    end
        
    private
        
        def contact_params
           params.require(:contact).permit(:name, :email, :phone, :message) 
        end
    
end
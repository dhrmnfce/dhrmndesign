class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def about
  end

  def services
  end

  def contact
  end
  
end

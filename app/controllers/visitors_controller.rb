class VisitorsController < ApplicationController

  def new
    @owner = Owner.new # @ means this will be available in the view.
    # render 'visitors/new' it not needed because of magic
    # Rails will be looking at the view visitor/new !
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'My birthday is soon.'
  end
end
class CartsController < ApplicationController
  def index

    respond_to do |format|
      format.html {render :layout => "customer"}
    end
  end
end

class GuestController < ApplicationController


  def index

  end

  def show
    @phones = Phone.where('model LIKE ?', "%#{params[:query]}%")
  end
end

class OffersController < ApplicationController
  before_action :authenticate_user!
  def index
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.valid?
      @offer.save!
      redirect_to '/'
    else
      render 'index'
    end
  end

  def update
    offer = Offer.find(params[:id])
    if params[:offer][:value] == '+'
      offer.users << current_user unless offer.users.include?(current_user)
    else
      offer.users.delete(current_user)
    end
    redirect_to request.referer
  end

  private

  def offer_params
    prms = params.require(:offer).permit(:name, :description, :url, :actual_price, :original_price, :avatar)
    prms[:user] = current_user
    prms
  end
end
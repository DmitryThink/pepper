class HomeController < ApplicationController
  def index
    @offers = Offer.where(confirmed: true)
    if params[:text]
      my_attributes = [:name, :description, :url]
      queries = my_attributes.map { |attr| "#{attr} LIKE '%#{params[:text]}%'" }
      @offers = Offer.where(queries.join(" OR "))
      @search_text = params[:text]
    end
  end

  # def search
  #  my_attributes = [:name, :description, :url]
  #  queries = my_attributes.map { |attr| "#{attr} LIKE '%#{params[:text]}%'" }
  #  @offers = Offer.where(queries.join(" OR "))
  #  @search_text = params[:text]
  #  render :index
  # end

  def show
    @offer = Offer.find(params[:id])
    @comment = Comment.new
  end
end

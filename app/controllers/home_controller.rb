class HomeController < ApplicationController
  def index
    @offers = Offer.where(confirmed: true)
                  .left_joins(:users)
                  .group(:id)
                  .order('COUNT(users.id) DESC')
    search
  end

  def new
    @offers = Offer.where(confirmed: true).order(created_at: :desc)
    search
    render :index
  end

  def commented
    @offers = Offer.where(confirmed: true).left_joins(:comments)
                  .group(:id)
                  .order('COUNT(comments.id) DESC')
    search
    render :index
  end

  def show
    @offer = Offer.find(params[:id])
    @comment = Comment.new
  end


  private

  def search
    if params[:text]
      my_attributes = [:name, :description, :url]
      queries = my_attributes.map { |attr| "#{attr} LIKE '%#{params[:text]}%'" }
      @offers = Offer.where(queries.join(" OR "))
      @search_text = params[:text]
    end
  end
end

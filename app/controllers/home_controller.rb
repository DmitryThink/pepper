class HomeController < ApplicationController
  def index
    @offers = Offer.where(confirmed: true)
    search
    tag
    @offers =  @offers.left_joins(:users)
                  .group(:id)
                  .order('COUNT(users.id) DESC')[size]
  end

  def new
    @offers = Offer.where(confirmed: true)
    search
    tag
    @offers =  @offers.order(created_at: :desc)[size]
    render :index
  end

  def commented
    @offers = Offer.where(confirmed: true)
    search
    tag
    @offers =  @offers.left_joins(:comments)
                  .group(:id)
                  .order('COUNT(comments.id) DESC')[size]
    render :index
  end

  def show
    @offer = Offer.find(params[:id])
    @comment = Comment.new
  end

  def by_user
    offer_ids = []
    current_user.tags.each do |tag|
      offer_ids += tag.offers.pluck(:id)
    end
    puts offer_ids
    @offers = Offer.where(id: offer_ids)[size]
    search
    render :index
  end

  private

  def search
    if params[:text]
      my_attributes = [:name, :description, :url]
      queries = my_attributes.map { |attr| "offers.#{attr} LIKE '%#{params[:text]}%'" }
      @offers = @offers.where(queries.join(" OR "))
      @search_text = params[:text]
    end
  end

  def tag
    if params[:tag]
      @offers = Tag.where(name: params[:tag]).first.offers.where(confirmed: true)
    end
  end

  def page
    params[:page].to_i
  end

  def size
    items_size = 32
    @size = 0..items_size-1
    @size = (page-1)*items_size..(page-1)*items_size+(items_size-1) if page > 1
    @size
  end
end

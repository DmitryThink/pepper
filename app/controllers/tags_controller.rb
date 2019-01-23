class TagsController < ApplicationController
  before_action :authenticate_user!
  def show
    current_user.tags << Tag.find(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.tags.delete(Tag.find(params[:id]))
    redirect_to request.referer
  end
end

class  ReadingsController < ApplicationController
  def index
    @readings = Reading.all.where(user_id: current_user.id)
  end

  def create
    Reading.create(user_id: params[:user_id], title: params[:title], url: params[:url], description: params[:description], is_active: true)
    redirect_to "/readings"
  end
end
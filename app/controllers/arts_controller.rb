class ArtsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @arts = Art.all
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.create(art_params)
    if @art.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def art_params
    params.require(:art).permit(:image, :title, :content, :category_id, :subcategory_id).merge(user_id: current_user.id)
  end

end
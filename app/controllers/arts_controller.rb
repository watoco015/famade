class ArtsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @arts = Art.all.order("created_at DESC")
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

  def show
    @art = Art.find(params[:id])
    @comment = Comment.new
    @comments = @art.comments.includes(:user)
  end

  def edit
    @art = Art.find(params[:id])
      unless @art.user_id == current_user.id
        redirect_to action: :index
      end
  end

  def update
    @art = Art.find(params[:id])
  
    if @art
      if @art.update(art_params)
        redirect_to art_path(@art)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    art = Art.find(params[:id])
    art.destroy
    redirect_to root_path
  end

  private
  def art_params
    params.require(:art).permit(:title, :content, :category_id, :subcategory_id, :image).merge(user_id: current_user.id)
  end

end
class ArtsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_art, only: [:show, :edit, :update]

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
    @comment = Comment.new
    @comments = @art.comments.includes(:user)
  end

  def edit
      unless @art.user_id == current_user.id
        redirect_to action: :index
      end
  end

  def update
  
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

  def set_art
    @art = Art.find(params[:id])
  end
end
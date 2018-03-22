class PostimagesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  def index
    @postimages = Postimage.order('created_at DESC')
  end
 
  def show
  end
 
  def new
    @postimage = Postimage.new
  end
 
  def create
    @postimage = Postimage.new(postimage_params)
    return redirect_to postimages_url, notice: 'You have sucsessfully created the postimage' if @postimage.save
    flash[:alert] = 'An Error'
    render :new
  end
 
  def edit
    render :new
  end
 
  def update
    if @postimage.update(postimage_params)
      flash[:notice] = 'Update sucessfully'
      redirect_to postimages_url
    else
      flash[:notice] = 'Update error'
      render :new
    end     
  end

  def destroy    
    if @postimage.destroy
      flash[:notice] = 'Destroy sucessfully'
      redirect_to postimages_url
    else
      flash[:notice] = 'Destroy error'
      redirect_to postimage_url
    end
  end
 
  private

  def set_post
    @postimage = Postimage.find(params[:id])
  end 
  def postimage_params
    params.require(:postimage).permit(:headline, :body, :order_show, :image, :article_id)
  end
 

end
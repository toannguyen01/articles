class PosttextsController < ApplicationController
  before_action :set_posttext, only: [:show, :edit, :update, :destroy]

  def index
    @posttexts = Posttext.all
  end

  def show

  end

  def new
    @posttext = Posttext.new
  end

  def create
    @posttext = Posttext.new(posttext_params)
    return redirect_to posttexts_url, notice: 'You have sucsessfully created the potstext' if @posttext.save
    flash[:alert] = 'An Error'
    render :new
  end

  def edit
    render :new
  end


  def update
    return redirect_to posttexts_url, notice: 'Update sucessfully' if @posttext.update(posttext_params)
    flash[:notice] = 'Update error'
    render :new
  end

  def destroy
    return redirect_to posttexts_url, notice: 'Destroy sucessfully' if @posttext.destroy
    flash[:notice] = 'Destroy error'
    redirect_to posttext_url
  end

  private

  def set_posttext
    @posttext = Posttext.find(params[:id])
  end

  def  posttext_params
    params.require(:posttext).permit(:headline, :content, :order_show, :like, :article_id)
  end
end
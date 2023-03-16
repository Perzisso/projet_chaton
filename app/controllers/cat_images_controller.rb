class CatImagesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    puts @item
    puts params[:catimage]
    @item.catimage.attach(params[:catimage])
    redirect_to(item_path(@item))
  end
end

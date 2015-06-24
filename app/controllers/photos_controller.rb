class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end

  def destroy
    @photos = Photo.find(params[:id])
    @photos.destroy
    redirect_to edit_product_path(@photos.product) , notice: '照片已刪除'
  end
end

class Product < ActiveRecord::Base
  mount_uploader :productimage, ProductimageUploader
end

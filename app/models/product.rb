class Product < ActiveRecord::Base
  mount_uploader :productimage, ProductimageUploader

  has_many :photos, :inverse_of => :product, :dependent => :destroy
  
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :photos, allow_destroy: true

end

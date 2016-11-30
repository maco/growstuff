class PhotoMapping < ActiveRecord::Base
  attr_accessor :photo_map_id, :has_photo_id, :has_photo_type

  belongs_to :photo
  belongs_to :has_photo, :polymorphic => true
end

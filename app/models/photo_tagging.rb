class PhotoTagging < ActiveRecord::Base
  attr_accessible :photo_tag_id

  belongs_to :photo
  belongs_to :has_photo, :polymorphic => true
end

module PhotoCapable
  extend ActiveSupport::Concern

  included do
    has_many :photo_mappings, as: :has_photo
    has_many :photos, through: :photo_mappings

    before_destroy :remove_from_list
  end

  def remove_from_list
    photolist = self.photos.to_a # save a temp copy of the photo list
    self.photos.clear # clear relationship b/w harvest and photo

    photolist.each do |photo|
      photo.destroy_if_unused
    end
  end
end

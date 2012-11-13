class Comic
  include Mongoid::Document

  field :title
  field :image_id

  attr_accessor :image

  before_save :store_image

  def store_image
  	if @image
      stored_image = Mongoid::GridFs.put(@image)
      self.image_id = stored_image.id
  	end
  end

  def image
    @image || Mongoid::GridFs.get(self.image_id)
  end

end

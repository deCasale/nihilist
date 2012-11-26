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
    if @image
      @image
    elsif self.image_id
      Mongoid::GridFs.get(self.image_id)
    end
  end

  def self.random
    unless count == 0
      all[(rand * count - 1).round]
    end
  end

  def self.previous(comic)
    where(:id.lt => comic.id).last
  end

  def self.next(comic)
    where(:id.gt => comic.id).first
  end

end

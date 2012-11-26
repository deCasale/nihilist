class Comic
  include Mongoid::Document

  field :title
  field :slug
  index({ :slug => 1 }, { :unique => true })
  field :image_id

  attr_accessor :image

  before_save :store_image, :generate_slug

  validates_presence_of :title

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

  def generate_slug
    slug = title.to_ascii.downcase.gsub(/[^a-z0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
    same_slug_count = Comic.where(slug: /^#{Regexp.escape(slug)}(?:-(\d+))?$/).count
    slug << "-#{same_slug_count + 1}" if same_slug_count > 0
    self.slug = slug
  end

  def to_param
    slug.blank? ? id : slug
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

  def self.find_by_slug(slug)
    where(:slug => slug).first
  end

  def self.find_by_slug!(slug)
    find_by_slug(slug) || raise(Mongoid::Errors::DocumentNotFound.new(self, { :slug => slug }))
  end

  def self.find_by_slug_or_id(slug_or_id)
    find_by_slug(slug_or_id) || where(:_id => slug_or_id).first
  end

  def self.find_by_slug_or_id!(slug_or_id)
    find_by_slug(slug_or_id) || where(:_id => slug_or_id).first || raise(Mongoid::Errors::DocumentNotFound.new(self, { :slug => slug_or_id }))
  end

end

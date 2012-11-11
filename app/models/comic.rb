class Comic# < ActiveRecord::Base
  include Mongoid::Document	
  include Mongoid::Paperclip

  field :title
  has_mongoid_attached_file :comic_picture
end

require 'carrierwave/orm/activerecord'

class Order < ActiveRecord::Base
	serialize :selectfiles
	mount_uploaders :images, ImageUploader
end

require 'carrierwave/orm/activerecord'

class Order < ActiveRecord::Base
	mount_uploaders :images, ImageUploader
end

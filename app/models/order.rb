require 'carrierwave/orm/activerecord'

class Order < ActiveRecord::Base
	serialize :selectfiles
	mount_uploaders :images, ImageUploader
	
	def paypal_url(return_path)
		values = {
			business: "tamono_kimi-facilitator-1@yahoo.co.jp",
			cmd: "_xclick",
			upload: 1,
			return: "#{Rails.application.secrets.app_host}#{return_path}",
			invoice: id,
			amount: course.price,
			item_name: course.name,
			item_number: course.id,
			quantity: '1'
		}
		"#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
	end
end

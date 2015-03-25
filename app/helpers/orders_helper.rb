module OrdersHelper
	def image_path_of(src, dir_name)
		File.dirname(File.dirname(src)) + "/" + dir_name + "/" + File.basename(src)
	end
end

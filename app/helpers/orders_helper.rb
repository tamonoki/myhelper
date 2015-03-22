module OrdersHelper
	def image_path_of(src, dir_name)
		File.dirname(File.dirname(src.url)) + "/" + dir_name + "/" + File.basename(src.url)
	end
end

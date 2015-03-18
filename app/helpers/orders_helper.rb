module OrdersHelper
	def image_path_from_dir(src, dir_name)
		res = File.dirname(src.to_s)
		res = File.dirname(res)
		res += '/' + dir_name + '/' + File.basename(src.to_s)
		return res
	end
end

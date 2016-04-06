# class Image
# 	attr_accessor :pixel
#
# 	def initialize(pixel)
# 		@pixel = pixel
# 	end
#
# 	def output_image
# 		@pixel.each do |pixel_row|
# 			pixel_row.each do |pixel_value|
# 				print pixel_value
# 			end
# 		end
# 	end
#
# end

class Image
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |x|
			puts x.join("")
		end
	end
end

image = Image.new([
	  	[0,0,0,0],
		  [0,1,0,0],
		  [0,0,0,1],
		  [0,0,0,0]
    ])
image.output_image

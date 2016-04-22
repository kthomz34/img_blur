class Image
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
			puts row.join("")
		end
	end

	def blur
		blurred_ary = []
				# finding locations of 1
		@image.each_with_index do |row, row_num|
			row.each_with_index do |pixel, col_num|
				if pixel == 1
					blurred_ary << [row_num, col_num]
				end
			end
		end

		# blurring around each 1
		blurred_ary.each do |location|
			row_num = location[0]
			col_num = location[1]
			@image[row_num][col_num-1] = 1 if col_num > 0
			@image[row_num][col_num+1] = 1 if col_num < @image[row_num].length - 1
			@image[row_num-1][col_num] = 1 if row_num > 0
			@image[row_num+1][col_num] = 1 if row_num < @image.length - 1
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

image.blur
image.output_image

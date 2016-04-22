class Image

	attr_accessor :image, :blur

	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
		  puts row.join("")
		end
	end

	def blur(n)
		return output_image if n.zero?
		height = @image.length
		width = @image[0].length
		buffer = []

		# create a duplicate of image called buffer
		@image.length.times do |y|
			buffer[y] = []
			@image[y].length.times do |x|
				if @image[y][x] == 1
					buffer[y][x] = 1
				else
					buffer[y][x] = 0
				end
			end
		end

		# run through image and change buffer accordingly
		@image.each.with_index do |row, i|
  		row.each.with_index do |cell, j|
				if cell == 1
					# RIGHT
					if j+1 < width
						buffer[i][j+1] = 1
					end
					# LEFT
					if (j-1) >= 0 && (j-1) < width
				  	buffer[i][j-1] = 1
				  end
				  # BELOW
				  if i+1 < height
				  	buffer[i+1][j] = 1
				  end
				  # ABOVE
				  if (i-1) >= 0 && (i-1) < height
				  	buffer[i-1][j] = 1
				  end
    		end
  		end
		end

	# update image to be buffer, repeat 'n' times
	@image = buffer
	blur(n - 1)
	end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.blur(2)

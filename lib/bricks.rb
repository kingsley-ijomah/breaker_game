class Brick
	def initialize(window, x, y)
		@x = x
		@y = y
		@image = Gosu::Image.new(window, './img/brick.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end
end
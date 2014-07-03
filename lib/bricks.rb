class Brick
	attr_reader :x, :y, :w, :h

	def initialize(window, x, y)
		@x = x
		@y = y
		@w, @h = 60, 20
		@image = Gosu::Image.new(window, './img/brick.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end
end
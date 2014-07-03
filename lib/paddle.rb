class Paddle
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@window = window
		@x = 200
		@y = 550
		@vx = 10
		@w, @h = 80, 20
		@image = Gosu::Image.new(@window, './img/paddle.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move_left
		unless @x < 0
			@x -= @vx
		end
	end

	def move_right
		unless @x > (@window.width - @w)
			@x += @vx
		end
	end
end
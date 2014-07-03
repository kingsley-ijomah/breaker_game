class Paddle
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@window = window
		@x = 200
		@y = 550
		@w, @h = 60, 20
		@image = Gosu::Image.new(@window, './img/paddle.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def move_left
		unless @y < 0
			@y -= 5
		end
	end

	def move_right
		unless @y > (@window.height - @h)
			@y += 5
		end
	end
end
require 'gosu'
require 'rubygems'

class Ball
	def initialize(window)
		@x = 200
		@y = 400
		@vx = -5
		@vy = 5
		@image = Gosu::Image.new(window, 'ball.png', false)
	end

	def move
		@x = @x + @vx
		@y = @y + @vy
	end

	def draw
		@image.draw(@x, @y, 1)
	end
end

class GameWindow < Gosu::Window
	def initialize
		super 800, 600, false
		self.caption = 'Breakout'
		@ball = Ball.new(self)
	end

	def update
		@ball.move
	end

	def draw
		@ball.draw
	end
end

window = GameWindow.new
window.show
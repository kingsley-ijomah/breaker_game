require 'rubygems'
require 'gosu'
Dir["./lib/*.rb"].each {|file| require file }

class GameWindow < Gosu::Window
	attr_accessor :width, :height

	def initialize
		@width = 800
		@height = 600
		super @width, @height, false
		self.caption = 'Breaker Game'
		@ball = Ball.new(self)
		@paddle = Paddle.new(self)
		@bricks = []
		(1..5).each do |row|
			(1..10).each do |col|
				@bricks.push Brick.new(self, col * 70, row * 30)
			end
		end
	end

	def touching?(obj1, obj2)
		obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h
	end

	def update
		@ball.move
		if button_down?(Gosu::KbLeft)
			@paddle.move_left
		end
		if button_down?(Gosu::KbRight)
			@paddle.move_right
		end
		if touching?(@ball, @paddle)
			@ball.bounce
		end
		@bricks.each do |brick|
			if touching?(@ball, brick)
				@ball.bounce
				@bricks.delete brick
			end
		end
	end

	def draw
		@ball.draw
		@paddle.draw
		@bricks.each do |brick|
			brick.draw
		end
	end
end

window = GameWindow.new
window.show
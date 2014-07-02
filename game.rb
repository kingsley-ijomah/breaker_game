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
	end

	def touching?(obj1, obj2)
		obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h
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
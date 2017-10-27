require "alimento/version"

module Alimento
  class Alimento
	attr_reader :nombre, :prt, :gluc, :lip

	def initialize(nombre,prt,gluc,lip)
		@nombre=nombre
		@prt=prt
		@gluc=gluc
		@lip=lip
	end

	def to_s()
		"#{@nombre} prt=#{@prt}g gluc=#{@gluc}g lip=#{@lip}g"
	end
	
	def kcal()
		@prt*4+@gluc*4+@lip*9
	end
  end
end

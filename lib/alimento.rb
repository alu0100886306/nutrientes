require "alimento/version"

module Alimento
	
	attr_reader :nombre, :prt, :gluc, :lip

	def initialize(nombre,prt,gluc,lip)
		@nombre=nombre
		@prt=prt
		@gluc=gluc
		@lip=lip
	end

end

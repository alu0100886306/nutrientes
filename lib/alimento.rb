require "alimento/version"
require "alimento/lista"

module Alimento
  class Alimento
	attr_reader :nombre, :prt, :gluc, :lip
	include Comparable
	
	def <=>(another)
		kcal <=> another.kcal
	end

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
	
  class Grupo < Alimento
	
	def initialize(grupo,nombre,prt,gluc,lip)
		super(nombre,prt,gluc,lip)
		@grupo=grupo
	end
	def to_s
		puts @grupo+"\n\t"+super.to_s
	end
  end
end

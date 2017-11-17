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
	
    # aibc=0 
    # ig=0
    # 100*(vvpruebas.map{|vprueba| aibc=0 (1..vprueba.length).each{|i| aibc+=((vprueba[i]-vprueba[0])+(vprueba[i-1]-vprueba[0]))*5/2 } } )/(vvglucosas.map{|vglucosa| aibc=0 (1..vglucosa.length).each{|i| aibc+=((vglucosa[i]-vglucosa[0])+(vglucosa[i-1]-vglucosa[0]))*5/2 } } )/vvpruebas.length+1

end

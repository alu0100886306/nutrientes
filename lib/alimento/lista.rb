Nodo = Struct.new(:dato,:next_,:prev_)

class Lista

	attr_reader :nombre, :head, :tail

	def initialize(nombre)
		@nombre=nombre
		@head=@tail=nil
	end

end

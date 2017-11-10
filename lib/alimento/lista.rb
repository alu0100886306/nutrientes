Nodo = Struct.new(:dato,:next_,:prev_)

class Lista

	attr_reader :nombre, :head, :tail

	def initialize(nombre)
		@nombre=nombre
		@head=@tail=nil
	end
	
	def add_back(dato)
		node=Nodo.new(dato,nil,nil)

		@head=node if @head.nil?
		node.prev_=@tail unless @tail.nil?
		@tail.next_=node unless @tail.nil?
		@tail=node
	end
end

Nodo = Struct.new(:dato,:next_,:prev_)

class Lista

	attr_reader :nombre, :head, :tail

	def initialize(nombre)
		@nombre=nombre
		@head=@tail=nil
	end
	
	def add_back(dato)
		if dato.instance_of?Alimento
			node=Nodo.new(dato,nil,nil)

			@head=node if @head.nil?
			node.prev_=@tail unless @tail.nil?
			@tail.next_=node unless @tail.nil?
			@tail=node
		end
		if dato.instance_of?Array
			i=0
			while i<dato.length do
				node=Nodo.new(dato[i],nil,nil)

				@head=node if @head.nil?
				node.prev_=@tail unless @tail.nil?
				@tail.next_=node unless @tail.nil?
				@tail=node
				i+=1
			end
		end
	end
	
	def pop_back
		if (@tail==@head)&&(@tail==nil)
			return nil
		elsif @tail==@head
			aux=@tail.dup
			@tail=@head=nil
			return aux
		else 
			aux=@tail.dup
			@tail=@tail.prev_
			@tail.next_=nil
			aux.prev_=nil
			return aux
		end
	end

	def pop_front
		if (@tail==@head)&&(@tail==nil)
			return nil
		elsif @tail==@head
			aux=@head.dup
			@head=@tail=nil
			return aux
		else
			aux=@head.dup
			@head=@head.next_
			@head.prev_=nil
			aux.next_=nil
			return aux
		end
	end
	
	def mostrar
		str= "#{@nombre}\n"
		aux=@head
		while aux!=nil do
			str+="\t"+aux.dato.to_s+"\n"
			aux=aux.next_
		end
		str
	end
end

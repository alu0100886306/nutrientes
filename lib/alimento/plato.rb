class Plato
	@@talimentos=[
		Alimento.new("Huevo frito",    14.1,  0.0, 19.5),
                Alimento.new("Leche",           3.3,  4.8,  3.2),
                Alimento.new("Mantequilla" ,    0.7,  0.0, 83.2),
		Alimento.new("Yogurt",          3.8,  4.9,  3.8),
		Alimento.new("Cerdo",          21.5,  0.0,  6.3),
		Alimento.new("Ternera",        21.1,  0.0,  3.1),
		Alimento.new("Pollo",          20.6,  0.0,  5.6),
		Alimento.new("Bacalao",        17.7,  0.0,  0.4),
		Alimento.new("Atun",           21.5,  0.0, 15.5),
		Alimento.new("Salmon",         19.9,  0.0, 13.6),
		Alimento.new("Aceite de oliva", 0.0,  0.2, 99.6),
		Alimento.new("Chocolate",       5.3, 47.0, 30.0),
		Alimento.new("Azucar",          0.0, 99.8,  0.0),
		Alimento.new("Arroz",           6.8, 77.7,  0.6),
		Alimento.new("Lentejas",       23.5, 52.0,  1.4),
		Alimento.new("Papas",           2.0, 15.4,  0.1),
		Alimento.new("Tomate",          1.0,  3.5,  0.2),
		Alimento.new("Cebolla",         1.3,  5.8,  0.3),
		Alimento.new("Calabaza",        1.1,  4.8,  0.1),
		Alimento.new("Manzana",         0.3, 12.4,  0.4),
		Alimento.new("Platanos",        1.2, 21.4,  0.2),
		Alimento.new("Pera",            0.5, 12.7,  0.3)		
	]
	@@tmediciones=[
		["pieza",40],
		["taza",30],
		["cucharon",10],
		["cucharada",5],
		["pizca",2],
		["cucharilla",3]
	]

	def initialize(nombre, &bloque)
		@nombre=nombre
		@alimentos=[]
		@kcal=0
		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&bloque)
			end
		end
	end

	def to_s
		output = @nombre
		output << "\n#{'=' * @nombre.size}\nComposición nutricional:\n"
		@alimentos.each do |alimento|
			output << alimento[0].to_s << " kcal=#{alimento[1]}\n"
		end
		output << "Valor energético total: #{@kcal}\n"
	end

	def vegetal(nombre, cantidad={})
		aux=[]
		@@talimentos.each{|alimento| aux << alimento if nombre=alimento.aux }
		aux << alimento.kcal*cantidad[:gramos] if cantidad[:gramos] 
		@@tmediciones.each{|unidad| aux << aux[0].kcal*unidad[1] if unidad[0]=cantidad[:porcion] } if cantidad[:porcion]

		@alimentos << aux
	end
        #def fruta end
        #def cereal end
        #def proteina end
        #def aceite end
        #def agua end
end

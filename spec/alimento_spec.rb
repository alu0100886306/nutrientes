require "spec_helper"
 
RSpec.describe Alimento do
  before :all do 
		@a1=Alimento::Alimento.new("Huevo frito", 14.1,  0.0, 19.5)
		@a2=Alimento::Alimento.new("Leche",        3.3,  4.8,  3.2)
		@a3=Alimento::Alimento.new("Mantequilla" , 0.7,  0.0, 83.2)
		@n1=Nodo.new(@a2,nil,nil)
		@n2=Nodo.new(@a1,nil,nil)
		@l1=Lista.new
		@comp_manz1= [6.7,6.5,6.8,6.9,7.0,7.1,6.9,6.9,6.9,6.7,6.9,7.3,7.0,7.0,7.2,7.1,6.8,7.2 ,7.3 ,7.0,6.8,6.7,6.8,6.7,6.9]
		@comp_manz2= [4.6,4.8,5.3,5.6,6.1,6.5,6.6,7.0,7.0,6.8,6.4,6.3,6.1,6.1,6.2,6.0,6.1,6.1 ,6.2 ,6.3,6.4,6.1,6.1,5.7,5.9]
		@glucosa1  = [4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9 ,6.8 ,6.3,6.2,6.3,6.2,6.3,6.1]
		@glucosa2  = [6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5]
	end
	
	describe "# Ig con programacion funcional" do
		it "IG comp_manzana" do
			expect(ig_func([@comp_manz1,@comp_manz2],[@glucosa1,@glucosa2])).to eq(54)
		end
	end	
	describe "# Alimentos comparables en base a su valor energético" do
		it "huevofrito < Leche" do
			expect(@a1<@a2).to eq(false)
		end
		it "huveofrito > Leche" do
			expect(@a1>@a2).to eq(true)			
		end
		it "iguales" do
			expect(@a1==@a2).to eq(false)
		end
	end
	describe "# metodos para insertar en la lista" do
		it "1 elemento" do
			@l1.add_back(@a2)
		end
		it "varios elementos" do
			@l1.add_back([@a1,@a2])
		end
	end

	describe "# modulo enumerable" do
		it "Seleccionar el segundo nodo de la lista" do
			expect(@l1[1]).to eq(nil)
		end	
		it "Seleccionar valor fuera de la lista" do
			expect(@l1[5]).to eq(nil)
		end
		it "método each" do
			@l1.each {|nodo| puts nodo.dato.to_s}
		end
	end
	describe "# mostrar lista" do	
		it "metodo para mostrar la lista formateada" do
                	expect(@l1.mostrar).to eq("algo")
        	end
	end
	
	describe "# métodos para extraer de la lista" do
		it "extraer por head"do
			expect(@l1.pop_front).to eq(@n2)
		end
		it "extraer por tail"do
			expect(@l1.pop_back).to eq(@n1)
		end
	end
	describe "# método mostrar nombre" do
		it "Se muestra correctamente" do
			expect(@a1.nombre).to eq("Huevo frito")
		end		
	end

	describe "# mostrar los componentes" do
		it "Se muestra las proteínas" do
			expect(@a1.prt).to eq(14.1)
			expect(@a2.prt).to eq(3.3)
		end
		it "Se muestra los glúcidos" do
			expect(@a1.gluc).to eq(0.0)
			expect(@a2.gluc).to eq(4.8)
		end
		it "Se muestra los lípidos" do
			expect(@a1.lip).to eq(19.5)
			expect(@a2.lip).to eq(3.2)
		end
	end

	describe "# mostrar alimento formateado" do
		it "Se muestra correctamente" do
			expect(@a1.to_s).to eq("Huevo frito prt=14.1g gluc=0.0g lip=19.5g")
		end
	end

	describe "# método para calcular valor energético" do
		it "Se clacula correctamente" do
			expect(@a1.kcal).to eq(231.9)
		end	
	end

	describe "# Ordenación en base al valor energético" do
		it "Con for" do
			expect(ord_for([@a1,@a2,@a3])).to eq([@a3,@a1,@a2])
		end
		it "Con each" do
			expect(ord_each([@a1,@a2,@a3])).to eq([@a3,@a1,@a2])
		end
		it "Con sort" do
			expect(ord_sort([@a1,@a2,@a3])).to eq([@a3,@a1,@a2])
		end
	end

	describe "# Benchmark de ordenación" do
                it "pruebas" do
			Benchmark.bm do |x|
  				x.report("for:")   { ord_for ([@a1,@a2,@a3]) }
  				x.report("each:") { ord_each ([@a1,@a2,@a3]) }
  				x.report("sort:")  { ord_sort ([@a1,@a2,@a3]) }
			end
		end
	end
	
end

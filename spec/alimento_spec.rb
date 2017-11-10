require "spec_helper"
require "alimento"

RSpec.describe Alimento do
  before :all do 
		@a1=Alimento::Alimento.new("Huevo frito", 14.1, 0.0, 19.5)
		@a2=Alimento::Alimento.new("Leche",       3.3,  4.8, 3.2)
		@n1=Nodo.new(@a2,nil,nil)
		@n2=Nodo.new(@a1,nil,nil)
		@l1=Lista.new("Lacteos")	
	end

	describe "# metodos para insertar en la lista" do
		it "1 elemento" do
			@l1.add_back(@a2)
		end
		it "varios elementos" do
			@l1.add_back([@a1,@a2])
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
	
end

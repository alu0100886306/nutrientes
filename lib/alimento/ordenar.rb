def ord_for (valimentos)

	for i in 0...valimentos.length
		max=valimentos[i]
		for j in i...valimentos.length
			if max.kcal < valimentos[j].kcal
				max,valimentos[j]=valimentos[j],max
			end
		end
		valimentos[i]=max
	end
	valimentos

end
def ord_each (valimentos) #Buscar otra forma

	valimentos.each_index do
		|i| valimentos.each_index do 
			|j| if valimentos[j].kcal<valimentos[i].kcal
				valimentos[i],valimentos[j]=valimentos[j],valimentos[i]
			end
		end
	end

end
def ord_sort (valimentos)
	valimentos.sort.reverse {|x,y| y.kcal<=>x.kcal }
end

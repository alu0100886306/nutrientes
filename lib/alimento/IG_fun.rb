def ig_func (vpruebas,vglucosas)
	a=vpruebas.collect do 
		|pruebas| pruebas.collect do 
			|prueba| (prueba-pruebas[0])*5-(pruebas[pruebas.length-1]-pruebas[0])*5/(2*pruebas.length)
		end.reduce('+')
	end #Array con los AIBC de cada prueba
	puts a.to_s
	b=vglucosas.collect do 
		|glucosas| glucosas.collect do 
			|glucosa| (glucosa-glucosas[0])*5-(glucosas[glucosas.length-1]-glucosas[0])*5/(2*glucosas.length)
		end.reduce('+')
	end #Array con los AIBC de cada glucosa
	puts b.to_s	
	i=-1
	ig=a.collect do 
		|aux| i+=1
		(aux*100)/b[i] 		
	end.reduce('+')
	ig/=vpruebas.length #IG
	return ig
end

def ig_func (vpruebas,vglucosas)
	a=vpruebas.collect do 
		|pruebas| pruebas.collect do 
			|prueba| (prueba-pruebas[0])*5-(pruebas[pruebas.length-1]-pruebas[0])*5/(2*pruebas.length)
		end.reduce('+')
	end #Array con los AIBC de cada prueba
	b=vglucosas.collect do 
		|glucosas| glucosas.collect do 
			|glucosa| (glucosa-glucosas[0])*5-(glucosas[glucosas.length-1]-glucosas[0])*5/(2*glucosas.length)
		end.reduce('+')
	end #Array con los AIBC de cada glucosa
	ig=a.zip(b).collect { |v1,v2| v1*100/v2 }.reduce('+') 
	ig/=vpruebas.length #IG
	return ig
end

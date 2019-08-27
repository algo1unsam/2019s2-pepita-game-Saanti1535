import ciudades.*
import wollok.game.*
import pepita.*

object pepita {
	var property energia = 100
	var property lugar = buenosAires 

	var property position = game.at(3,3)
	
	method image() = if (energia<=100 )"pepita.png" else "pepita-gorda-raw.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(algo) {
		
			if (lugar != algo) {
				self.move(algo.position())
				lugar = algo
				}
			else (game.say(self, "Ya estoy acá!" ))
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if( energia >= self.energiaParaVolar(position.distance(nuevaPosicion)) ) {
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)			
		}
		else game.say(self, "No tengo energía, dame de comer!")
	}	
}

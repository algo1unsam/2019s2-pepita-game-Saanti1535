import ciudades.*
import wollok.game.*
import pepita.*

/********************************************* PEPITA *********************************************/
object pepita {
	var property energia = 100
	var property lugar = buenosAires 

	var property position = game.at(3,3)
	
	method image() = if (energia<=100 )"pepita.png" else "pepita-gorda-raw.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method chocasteCon(alguien){
		alguien.darDeComerA(self)
	}
	
	method volaHacia(algo) {
			if (lugar != algo) {
				self.move(algo.position())
				lugar = algo
				}
			else (game.say(self, "Ya estoy en " + algo.nombre() + "!" ))
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


/********************************************* ROQUE *********************************************/
object roque {
	var property position = game.at(5,2)
	var comida=null
	
	method image() = "jugador.png"
	
	method agarra(alimento){
		if (comida!=null) {
			acciones.respown(comida)
		} 
		comida=alimento
		game.removeVisual(comida)
	}
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)			
	}
	
	method darDeComerA(alguien){
		if (comida!=null){
			alguien.come(comida)
			acciones.respown(comida)
			comida = null
		} else game.say(alguien, "No me trajiste nada!") 
	}
	
}

/********************************************* ACTIONS *********************************************/
object acciones {
	method respown(algo){
		algo.position(game.at(0.randomUpTo(9), 0.randomUpTo(9)))
		game.addVisual(algo)
	}
}
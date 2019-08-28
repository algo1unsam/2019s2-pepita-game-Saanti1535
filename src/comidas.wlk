import wollok.game.* 
import pepita.*

/********************************************* MANZANA *********************************************/
object manzana {
	var property position = game.at(5,1)
	method image() = "manzana.png"
	
	method energia() = 80
	
	method chocasteCon(alguien){
		alguien.agarra(self)
	}
	
	/*method teEncontro(alguien){
		alguien.come(self)
	}*/
}


/********************************************* ALPISTE *********************************************/
object alpiste {
	var property position = game.at(5,5)
	method image() = "alpiste.png"
	
	method energia() = 5
	
	method chocasteCon(alguien){
		alguien.agarra(self)
	}
	
	/*method teEncontro(alguien){
		alguien.come(self)
	}*/
}

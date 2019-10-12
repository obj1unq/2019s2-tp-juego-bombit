import wollok.game.*
import personajes.*

object bomba{
	var property danio = 20
}


object muro{
   var property position = game.at(0, 1)
	method image() = "muro.png "
	
	method esAtravesable() = false
}

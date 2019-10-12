import wollok.game.*
import personajes.*

object bomba{
	var property danio = 20
}


object muro{
   var property position = game.at(7, 8)
	method image() = "muro.png "
}

import wollok.game.*
import personajes.*

object bomba{
	var property danio = 20
	method image() = "bomba.png"
	method esMoneda(){ return false}
}


object moneda{
	var property position = game.at(1,5)
	method image() = "moneda.png"
	method esMoneda(){ return true}
}

object muro{
   var property position = game.at(0, 1)
	method image() = "muro.png "
	method esMoneda(){ return false}
	method esAtravesable() = false
}

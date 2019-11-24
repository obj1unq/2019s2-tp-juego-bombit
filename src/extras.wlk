import wollok.game.*
import personajes.*

object moneda{
	var property position = game.at(1,5)
	method image() = "moneda.png"
	method esMoneda(){ return true}
	method esAtravesable() = true
}

object inicio{
	var property position = game.at(0,0)
	method image() = "inicio.jpg"
}

object municion{
	var property position = game.at(18,2)
	method image() = "municion.png"
}
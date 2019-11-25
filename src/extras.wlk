import wollok.game.*
import personajes.*

object moneda{
	var property position = game.at(1,5)
	method image() = "moneda.png"
	method esMoneda(){ return true}
	method esAtravesable() = true
	method teEncontro(trump){
		
	} 
}

object misil{
	var	property position = game.at(17,2)
	method image() = "misil.png"
	method dirigido() {
		position = game.at(position.x()-1,2) 
	}
	
	method teEncontro(trump){
		if ( jugador.vidas() > 1){
			jugador.vidas(jugador.vidas() - 1)
			game.removeVisual(jugador)
			game.addVisualIn(jugador, game.at(1,1))
		}
		else game.say(jugador, " Me quede sin vidas")
			 game.stop()
	}
}

object inicio{
	var property position = game.at(0,0)
	method image() = "inicio.jpg"
}

object municion{
	var property position = game.at(18,2)
	method image() = "municion.png"
}
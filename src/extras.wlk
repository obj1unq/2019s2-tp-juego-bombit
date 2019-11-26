import wollok.game.*
import personajes.*

object kim{
	var property position = game.at(18,18)
	method image() = "kim/parado.png" 
	method teEncontro(trump){ 
  		game.say(trump, "Conquiste")
		game.onTick(1000, "Trump Lo Hizo Nuevamente", {game.stop()})
  	}
  } 

class Moneda{
	var property position
	method image() = "moneda.png"
	method esMoneda(){ return true}
	method esAtravesable() = true
	method teEncontro(trump){
		
	} 
}

object misil{
	var	property position = game.at(17,5)
	method image() = "misil.png"
	method dirigido() {
		if ( position == trump.position() or  position == game.at(1,5) ){
			position = game.at(17,5)
		}
		else position = game.at(position.x()-1,5) 
	}
	
	method esAtravesable() = false  
	
	method teEncontro(trump){
		trump.position(game.at(1,1) )
		if ( trump.vidas() > 1){
			trump.vidas(trump.vidas() - 1)
		}
		else game.say(trump, " Me quede sin vidas")
			 game.addVisual(fin)

	}
}

object inicio{
	var property position = game.at(0,0)
	method image() = "inicio.jpg"
}

object fin{
	var property position = game.at(0,0)
	method image() = "fin.jpg"
}

object municion{
	var property position = game.at(18,5)
	method image() = "municion.png"
}
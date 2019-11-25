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

object moneda{
	var property position = game.at(1,5)
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
	
	method teEncontro(trump){
		if ( trump.vidas() > 1){
			trump.vidas(trump.vidas() - 1)
			game.removeVisual(trump)
			game.addVisualIn(trump, game.at(1,1))
		}
		else game.say(trump, " Me quede sin vidas")
			 game.stop()
	}
}

object inicio{
	var property position = game.at(0,0)
	method image() = "inicio.jpg"
}

object municion{
	var property position = game.at(18,5)
	method image() = "municion.png"
}
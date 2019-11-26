import wollok.game.*
import personajes.*

//Representacion de la llegada a la meta

object kim{
	var property position = game.at(18,18)
	method image() = "kim/parado.png" 
	method teEncontro(trump){ 
  		game.say(trump, "Conquiste")
		game.onTick(1000, "Trump Lo Hizo Nuevamente", {game.stop()})
  	}
  } 


//Representacion de monedas

class Moneda{
	var property position
	method image() = "moneda.png"
	method esMoneda(){ return true}
	method esAtravesable() = true
	method teEncontro(trump){
		
	} 
}

//Representación de los lanzamisiles representado con dos objetos: municio es estatico, misil es el objeto que se mueve.

class Municion{
	var property position 
	method image() = "municion.png"
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


//Representación de las imágenes para el inicio y el fin

object inicio{
	var property position = game.at(0,0)
	method image() = "inicio.jpg"
}

object fin{
	var property position = game.at(0,0)
	method image() = "fin.jpg"
}


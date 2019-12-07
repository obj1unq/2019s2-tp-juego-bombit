import wollok.game.*
import personajes.*
import niveles.*

//Representacion de la llegada a la meta

object kim{
	var property position = game.at(17,16)
	method image() = "kim/parado.png"
	method esAtravesable() = true
	method esMoneda() = false
	method teEncontro(trump){ 
		if ( trump.nivelActual() == nivel1){
			self.pasarDeNivel()
		}
		else{
			self.trumpGana()
		}
		
  	}
  	
  	method pasarDeNivel(){
  		if ( trump.encontroTodoElDinero() ){	
  			game.addVisual(pasarNivel)
		}
		else{
			game.say(self, "Tenes que robar toda la plata")
  			game.say(trump, "Uh coreano me tenes harto")
		}
  	}
  	
  	method trumpGana(){
  		if ( trump.encontroTodoElDinero() ){
  			game.addVisual(conquista)
  			game.onTick(2000, "Ganaste" ,{
  				trump.estoyVivo(false)
  				game.stop()
  			})
  		}
  		else {
  			game.say(self, "Tenes que robar toda la plata")
  			game.say(trump, "Uh coreano me tenes harto")
  		}
  	}	
} 

//Representacion de los bordes del juego

class Borde{
  const property posicionesParaGenerarMuros = []
   method image() = "muro.png"
   method esAtravesable() = false
   method teEncontro(trump){}
   method generarMuros() {
   const ancho = game.width() - 1 // debemos restarles uno para 
   const alto = game.height() - 1 // que las posiciones se generen bien.
 
		
   (0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(game.at(num, alto))} // lado superior
   (0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(game.at(num, 0))} // lado inferior
   (0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(game.at(ancho, num))} // lado derecho
   (0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(game.at(0, num))} // lado izquierdo
    
   posicionesParaGenerarMuros.forEach {posicion => game.addVisualIn(new Borde(),posicion)}
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

//Representación de los lanzamisiles representado con dos objetos: municion es estatico, misil es el objeto que se mueve.

class Municion{
	var property position 
	method image() = "municion.png"
	method teEncontro(trump){}
	method esAtravesable() = false 
}

object misil{
	var	property position = game.at(17,5)
	method image() = "misil.png"
	
	method dirigido() {
		if ( position == trump.position() or  position == game.at(1,5) ){
			position = game.at(17,5)
		}
		else {  position = game.at(position.x()-1,5) 
		}
		
	}
	
	method esAtravesable() = false  
	
	method teEncontro(trump){
			 trump.estoyVivo(false)
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

object instrucciones{
	var property position = game.at(0,0)
	method image() = "instrucciones.jpg"
}

object conquista{
	var property position = game.at(0,0)
	method image() = "win.jpg"
}

object pasarNivel{
	var property position = game.at(0,0)
	method image() = "pasarNivel.jpg"
}


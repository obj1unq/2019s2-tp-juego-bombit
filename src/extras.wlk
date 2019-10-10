import wollok.game.*
import personajes.*

object bomba{
	var property danio = 20
}


object muro{
   var property position = game.at(7, 8)
	method image() = "muro.png "
	
   method generarMuros() {
   const ancho = game.width() - 1 // debemos restarles uno para 
   const alto = game.height() - 1 // que las posiciones se generen bien.
   const posicionesParaGenerarMuros = []
		
   (0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Position(num, alto))} // lado superior
   (0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Position(num, 0))} // lado inferior
   (0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Position(ancho, num))} // lado derecho
   (0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Position(0, num))} // lado izquierdo
    
   posicionesParaGenerarMuros.forEach {posicion => game.addVisualIn(self,posicion)}
}
}

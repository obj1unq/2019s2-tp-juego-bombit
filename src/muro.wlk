import wollok.game.*
import extras.*
import niveles.*

object pared {
	
	  var imagen = "pared.png" 
      method image()= imagen
	
	method generarMuros() {
		const ancho = game.width() - 1 
		const alto = game.height() - 1 
		const posicionesParaGenerarMuros = []
		
		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(game.at(num, alto))} // lado superior
		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(game.at(num, 0))} // lado inferior
		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(game.at(ancho, num))} // lado derecho
		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(game.at(0, num))} // lado izquierdo
		
		posicionesParaGenerarMuros.forEach {posicion => game.addVisualIn(self,posicion)}
}
	
}

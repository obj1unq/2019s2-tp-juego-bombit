import wollok.game.*
import extras.*
import niveles.*


object jugador {
  
  var property orientacion = arriba_trump
  var property monedas = 0
  var property bombas = 5 
  var property position = game.at(1,1)
  var property tienePoder = false
  
  var imagen = "trump/parado.png" 
  
  method image()= imagen
  
   method puedeMoverAl( unaOrientacion ) {
  	return 
    game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
	}
 
  method mover( posicion, unaOrientacion ) { 
    orientacion = unaOrientacion
	self.actualizarImagen()
    if( self.puedeMoverAl( unaOrientacion )) { 
    	position = posicion
    }
    else {
    }
  }
  
  method actualizarImagen() {
    game.removeVisual(self)
    imagen = orientacion.imagenDelJugador()
	game.addVisual(self)
  }
  
  method recolectar(moneda){
  	self.monedas( monedas + 1) 
  	game.removeVisual(moneda)
  }
  
  method agarrarPoder(poder) {
  	self.tienePoder(true) 
	game.removeVisual(powerUpBomba)
  }
  
  method explotar() {
  	
  }
  
  method ponerBomba(){
  	game.addVisualIn(new Bomba(), position)
  	self.bombas( bombas - 1)
  }
  
}
 
object arriba_trump {
  method imagenDelJugador() = "trump/espalda.png"
  method posicionEnEsaDireccion() = jugador.position().up(1)
}

object abajo_trump{
  method imagenDelJugador() = "trump/parado.png" 
  method posicionEnEsaDireccion() = jugador.position().down(1)

}

object izquierda_trump{
  method imagenDelJugador() = "trump/izq.png"
  method posicionEnEsaDireccion() = jugador.position().left(1)
}

object derecha_trump {
  method imagenDelJugador() = "trump/derecha.png"
  method posicionEnEsaDireccion() = jugador.position().right(1)
}


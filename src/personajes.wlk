import wollok.game.*
import extras.*
import niveles.*


object jugador {
  
  var property orientacion = arriba_trump
  var property monedas = 0 
  var property position = game.at(0,0)
  
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
  	monedas =+ 1
  	game.removeVisual(moneda)
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


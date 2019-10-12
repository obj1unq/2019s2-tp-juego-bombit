import wollok.game.*
import extras.*
import niveles.*


object jugador {
  
  var property orientacion = arriba //debemos inicializarla con la orientación a la que empieza viendo el jugador.
                            //podría resolverse sin guardar la orientación en una variable, 
			    //y pasándole la orientación como parámetro al método actualizarImagen().
  
  var property position = game.at(0,0)
  var imagen = "parado.png" 
  
  method image()= imagen
  
   method puedeMoverAl( unaOrientacion ) {
  	return 
    game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
	}
 
  method mover( posicion, unaOrientacion ) { 
    orientacion = unaOrientacion
    if( self.puedeMoverAl( unaOrientacion )) { 
    	self.actualizarImagen()
    	position = posicion
    }
    else {
    }
  }
  
  method actualizarImagen() {
    imagen = orientacion.imagenDelJugador()
		game.addVisual(self)
  }
  
}
 
object arriba {
  method imagenDelJugador() = "espalda.png"
  method posicionEnEsaDireccion() = jugador.position().up(1)
}

object abajo {
  method imagenDelJugador() = "parado.png" 
  method posicionEnEsaDireccion() = jugador.position().down(1)

}

object izquierda {
  method imagenDelJugador() = "izq.png"
  method posicionEnEsaDireccion() = jugador.position().left(1)
}

object derecha {
  method imagenDelJugador() = "derecha.png"
  method posicionEnEsaDireccion() = jugador.position().right(1)
}
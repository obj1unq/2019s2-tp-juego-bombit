import wollok.game.*
import extras.*
import niveles.*


object jugador {
  
  var orientacion = derecha //debemos inicializarla con la orientación a la que empieza viendo el jugador.
                            //podría resolverse sin guardar la orientación en una variable, 
			    //y pasándole la orientación como parámetro al método actualizarImagen().
  var imagen = "parado.png"
  
  method position() = game.at(0,0)
  method image() = imagen
  
  method mover( posicion, unaOrientacion ) { 
    orientacion = unaOrientacion 
    self.actualizarImagen() 
    if( self.puedeMoverAl( unaOrientacion )) { }
    else {}
  }
  
  method actualizarImagen() {
    imagen = orientacion.imagenDelJugador()
	game.addVisual(self)
  }
  
  method puedeMoverAl( unaOrientacion ) {
  	return 
    game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
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

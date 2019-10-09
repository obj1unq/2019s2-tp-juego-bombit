import wollok.game.*
import extras.*
import niveles.*

object personaje1 {
	var property vida = 100
	var property position = game.origin()
	const property bombas = []
	
//	method image() {
//		return if ( SE TOCA ARRIBA ) "espalda.png"
//			   else if ( SE TOCA DER) "derecha.png"
//			   else if ( SE TOCA IZQ) "izq.png"
//			   else if ( self.estaMuerto() ) "muerto.png" 
//			   else "parado.png"
//			method ponerBomba() {
//				//TODO: Código autogenerado 
//			}
//	}
	method irA(nuevaPosicion){
		//Aca va la condicion preguntando si puede moverse a esta nueva posicion
		position = nuevaPosicion
	}
	
	method estaMuerto() {
		return vida <= 0
	}
	
	method choquePared(){
		return ( position == pared.position() )
	}
	
	method tengoBombas(){
		return ( not bombas.isEmpty() )
	}
	
}



object jugador {
  
  var orientacion = derecha //debemos inicializarla con la orientación a la que empieza viendo el jugador.
                            //podría resolverse sin guardar la orientación en una variable, 
			    //y pasándole la orientación como parámetro al método actualizarImagen().

  method position() = game.at(4,8)
  method image() = orientacion.imagenDelJugador()
  
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
  method imagenDelJugador() = "jugador-up.png"
  method posicionEnEsaDireccion() = jugador.position().up(1)
}

object abajo {
  method imagenDelJugador() = "jugador-down.png"
  method posicionEnEsaDireccion() = jugador.position().down(1)
}

object izquierda {
  method imagenDelJugador() = "jugador-left.png"
  method posicionEnEsaDireccion() = jugador.position().left(1)
}

object derecha {
  method imagenDelJugador() = "jugador-right.png"
  method posicionEnEsaDireccion() = jugador.position().right(1)
}

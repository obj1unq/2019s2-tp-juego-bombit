import wollok.game.*
import extras.*
import niveles.*


object jugador {
  
  var property orientacion = arriba //debemos inicializarla con la orientación a la que empieza viendo el jugador.
                            //podría resolverse sin guardar la orientación en una variable, 
			    //y pasándole la orientación como parámetro al método actualizarImagen().
  
  var property position = game.at(0,0)
  
  method image(){
  		return if ( orientacion == derecha.orientacion() ) "derecha.png"
  			   else if 	( orientacion == izquierda.orientacion()) "izq.png"
  			   else if ( orientacion == arriba.orientacion()) "espalda.png"
  			   else "parado.png" 
  	}
  
   method puedeMoverAl( unaOrientacion ) {
  	return 
    game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
	}
 
  method mover( posicion, unaOrientacion ) { 
    orientacion = unaOrientacion
    if( self.puedeMoverAl( unaOrientacion )) { 
    	position = posicion
    }
    else {
    }
  }
  
}
 
object arriba {
	method orientacion(){ 
		return self
	}	
  method posicionEnEsaDireccion() = jugador.position().up(1)
}

object abajo {
	method orientacion(){ 
		return self
	}	
  method posicionEnEsaDireccion() = jugador.position().down(1)

}

object izquierda {
	method orientacion(){ 
		return self
	}	
  method posicionEnEsaDireccion() = jugador.position().left(1)
}

object derecha {
  	method orientacion(){ 
		return self
	}	
  method posicionEnEsaDireccion() = jugador.position().right(1)
}
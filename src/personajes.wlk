import wollok.game.*
import extras.*
import niveles.*

object trump {
  var property nivelActual
  var property orientacion = arriba_trump
  var property monedas = 0
  var property position = game.at(1,1)
  var imagen = "trump/parado.png" 
  var property estoyVivo = false
  
  method image()= imagen
  
  method iniciar(){
  	self.origen()
  	self.monedas(0)
  	self.estoyVivo(true)
  }
  
  method origen(){
  	position = game.at(1,1)
  }
  
  method encontroTodoElDinero(){
  	return monedas == self.nivelActual().totalMonedas()
  }
  
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
  
  method teEncontro(trump){ }
}


//Representacion de las imagenes que provocan la sensacion de movimiento/direccion

object arriba_trump {
  method imagenDelJugador() = "trump/espalda.png"
  method posicionEnEsaDireccion() = trump.position().up(1)
}

object abajo_trump{
  method imagenDelJugador() = "trump/parado.png" 
  method posicionEnEsaDireccion() = trump.position().down(1)

}

object izquierda_trump{
  method imagenDelJugador() = "trump/izq.png"
  method posicionEnEsaDireccion() = trump.position().left(1)
}

object derecha_trump {
  method imagenDelJugador() = "trump/derecha.png"
  method posicionEnEsaDireccion() = trump.position().right(1)
}


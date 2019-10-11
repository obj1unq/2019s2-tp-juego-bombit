import extras.*
import wollok.game.*
import personajes.*

object nivel1 {
	method iniciar() {
		game.addVisual(muro)
		game.addVisualCharacter(jugador)
	}
}

object config {
	method configurarTeclas() {
		
		  keyboard.up().onPressDo { jugador.mover(arriba.posicionEnEsaDireccion(),arriba) }
		  keyboard.down().onPressDo { jugador.mover(abajo.posicionEnEsaDireccion(),abajo) }
		  keyboard.left().onPressDo { jugador.mover(izquierda.posicionEnEsaDireccion(),izquierda) }
		  keyboard.right().onPressDo { jugador.mover(derecha.posicionEnEsaDireccion(),derecha) }
		  //keyboard.enter().onPressDo( if ( personaje1.tengoBombas() ) game.addVisual(bomba))
	}
}


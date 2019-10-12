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
		
		  keyboard.up().onPressDo { jugador.mover(jugador.position().up(1), arriba) }
		  keyboard.down().onPressDo { jugador.mover(jugador.position().down(1), abajo) }
		  keyboard.left().onPressDo { jugador.mover(jugador.position().left(1), izquierda) }
		  keyboard.right().onPressDo { jugador.mover(jugador.position().right(1), derecha) }
		  //keyboard.enter().onPressDo( if ( personaje1.tengoBombas() ) game.addVisual(bomba))
	}
}


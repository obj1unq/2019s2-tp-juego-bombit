import extras.*
import wollok.game.*
import personajes.*

object nivel1 {
	method iniciar() {
		game.addVisual(muro)
		game.addVisual(moneda)
		game.addVisualCharacter(jugador)
		config.configurarTeclas()

	}
}

object config {
	method configurarTeclas() {
		
		  keyboard.up().onPressDo { jugador.mover(jugador.position().up(1), arriba_trump) }
		  keyboard.down().onPressDo { jugador.mover(jugador.position().down(1), abajo_trump) }
		  keyboard.left().onPressDo { jugador.mover(jugador.position().left(1), izquierda_trump) }
		  keyboard.right().onPressDo { jugador.mover(jugador.position().right(1), derecha_trump) }
		  keyboard.m().onPressDo({ if (game.uniqueCollider(jugador).esMoneda() )jugador.recolectar(game.uniqueCollider(jugador))})
	}
}


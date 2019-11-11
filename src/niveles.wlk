import extras.*
import wollok.game.*
import personajes.*
import muro.*

object nivel1 {
	method iniciar() {
		game.addVisual(muro)
		game.addVisual(moneda)
		game.addVisual(powerUpBomba)
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
		  keyboard.n().onPressDo({ if (game.uniqueCollider(jugador).esPowerUp() )jugador.agarrarPoder(game.uniqueCollider(jugador))})
		  keyboard.b().onPressDo({ if (jugador.bombas() > 0 )jugador.ponerBomba()})
		  	
	}
}



import extras.*
import wollok.game.*
import personajes.*



object nivel1 {

	method iniciar() {
		game.addVisual(pared)
		game.addVisualCharacter(personaje1)
		game.addVisualCharacter(personaje2)
	}

}

object config {

	method configurarTeclas() {
		
		  keyboard.up().onPressDo { jugador.mover(jugador.position().up(1),arriba) }
		  keyboard.down().onPressDo { jugador.mover(jugador.position().down(1),abajo) }
		  keyboard.left().onPressDo { jugador.mover(jugador.position().left(1),izquierda) }
		  keyboard.right().onPressDo { jugador.mover(jugador.position().right(1),derecha) }
		
		
		keyboard.left().onPressDo({ if ( not personaje1.muerto()) personaje1.irA(personaje1.position().left(1))})
		keyboard.right().onPressDo({ if ( not personaje1.muerto()) personaje1.irA(personaje1.position().right(1))})
		keyboard.up().onPressDo({ if  (not personaje1.muerto()) personaje1.irA(personaje1.position().up(1))})
		keyboard.down().onPressDo({ if  ( not personaje1.muerto()) personaje1.irA(personaje1.position().down(1))})
		
		keyboard.enter().onPressDo( if ( personaje1.tengoBombas() ) game.addVisual(bomba))
	}

	method configurarColisiones() {
		game.onCollideDo(personaje1, { algo => algo.teEncontro(personaje1)})
	}

}


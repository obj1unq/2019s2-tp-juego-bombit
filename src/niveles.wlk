import extras.*
import wollok.game.*
import personajes.*
import muro.*

object nivel1 {
	method iniciar() {
		game.addVisual(kim)
		game.addVisual(misil)
		game.addVisual(municion)
		game.addVisual(moneda)
		game.addVisualCharacter(trump)
		game.addVisual(inicio)
		config.configurarTeclas()
		config.configurarColisiones()
	}
}

object config {
	method configurarTeclas() {
		
		  keyboard.up().onPressDo { trump.mover(trump.position().up(1), arriba_trump) }
		  keyboard.down().onPressDo { trump.mover(trump.position().down(1), abajo_trump) }
		  keyboard.left().onPressDo { trump.mover(trump.position().left(1), izquierda_trump) }
		  keyboard.right().onPressDo { trump.mover(trump.position().right(1), derecha_trump) }
		  keyboard.m().onPressDo({ if (game.uniqueCollider(trump).esMoneda() )trump.recolectar(game.uniqueCollider(trump))})
		  keyboard.space().onPressDo({ game.removeVisual(inicio)
		  							   game.onTick(200, "movimiento",{ 
		  									misil.dirigido()
		  								})
		  })
		  	
	}
	
	method configurarColisiones() {
		game.onCollideDo(trump, { algo => algo.teEncontro(trump)})
	}
}



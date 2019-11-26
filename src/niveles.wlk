import extras.*
import wollok.game.*
import personajes.*

object nivel1 {
	method iniciar() {
		game.addVisual(kim)
		game.addVisual(misil)
		game.addVisualIn(new Municion() , game.at(18,5))
		game.addVisualIn(new Municion() , game.at(18,9))	
		game.addVisualIn(new Moneda(), game.at(1,5))
		game.addVisualIn(new Moneda(), game.at(1,9))
		game.addVisualIn(new Moneda(), game.at(7,9))
		game.addVisualCharacter(trump)
		game.addVisual(inicio)
		config.configurarTeclas()
		config.configurarColisiones()
	}
}

object config {
	method configurarTeclas() {
		  
		  //Acciones del personaje
		 
		  keyboard.up().onPressDo ({ if ( trump.estoyVivo() )  trump.mover(trump.position().up(1), arriba_trump)  })
		  keyboard.down().onPressDo ({ if ( trump.estoyVivo() ) trump.mover(trump.position().down(1), abajo_trump) })
		  keyboard.left().onPressDo ({ if ( trump.estoyVivo() ) trump.mover(trump.position().left(1), izquierda_trump) })
		  keyboard.right().onPressDo ({ if ( trump.estoyVivo() ) trump.mover(trump.position().right(1), derecha_trump) })
		  keyboard.m().onPressDo({ if (trump.estoyVivo() and game.uniqueCollider(trump).esMoneda() )trump.recolectar(game.uniqueCollider(trump))})
		  
		  
		  //Acciones en pantalla sobre el juego
		 
		  keyboard.space().onPressDo({ game.removeVisual(inicio)
		  							   game.onTick(200, "movimiento",{ 
		  									misil.dirigido()
		  								})
		  })
		  keyboard.r().onPressDo({ 
		  				game.clear()
		  				nivel1.iniciar()
		  } )
		  keyboard.enter().onPressDo( { game.stop() } )
	}
	
	method configurarColisiones() {
		game.onCollideDo(trump, { algo => algo.teEncontro(trump)})
	}
}



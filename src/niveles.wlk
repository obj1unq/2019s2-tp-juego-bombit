import extras.*
import wollok.game.*
import personajes.*

object nivel1 {
	method iniciar() {
		const borde = new Borde()
		borde.generarMuros() 
		game.addVisual(kim)
		game.addVisual(misil)
		game.addVisualIn(new Municion() , game.at(18,5))	
		game.addVisualIn(new Moneda(), game.at(2,5))
		game.addVisualIn(new Moneda(), game.at(12,14))
		game.addVisualIn(new Moneda(), game.at(16,2))
		game.addVisualCharacterIn(trump , game.at(1,1))
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
		 
		 
		 //Iniciar el juego
		  keyboard.space().onPressDo({ if ( game.allVisuals().contains(inicio)){
			  							   game.removeVisual(inicio)
			  							   game.onTick(100, "movimiento",{ 
			  									misil.dirigido()
			  								})
			  							   trump.iniciar()
		  								}
		  })
		  
		  //Popup de instrucciones
		  keyboard.i().onPressDo({
		  		game.addVisual(instrucciones)
		  		game.schedule(5500, { 
					game.removeVisual(instrucciones)		  			
		  		})
		  })
		  
		  //Reiniciar el juego
		  keyboard.r().onPressDo({ 
		  				game.clear()
		  				nivel1.iniciar()
		  				trump.iniciar()
		  } )
		  
		  //Cerrar el juego
		  keyboard.enter().onPressDo( { game.stop() } )
	}
	
	method configurarColisiones() {
		game.onCollideDo(trump, { algo => algo.teEncontro(trump)})
	}
}



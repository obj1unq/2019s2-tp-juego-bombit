import wollok.game.*
import personajes.*

class Bomba {
	
	var property danio = 20
	
	method imagen() = "bomba.png"
	
	method explotar(position){
		game.removeVisual(self)
		self.detonar(position)
	}

	method detonar(position){
		const explosion = new Explosion()
		//if (jugador.tienePoder()) { explosion.explotarPowerUp(position) } else { explosion.explotar(position) }
		explosion.explotar(position)
	} 		
	
}

object powerUpBomba{
	var property position = game.at(10,3)
	method imagen() = "misil.png"
	method esPowerUp() = true
	
}

class Explosion {
	var hayFuego = false
	method image()= "ExplosionCentro.png"
	method existe() { hayFuego = not hayFuego }
	method esPowerUp()= false 
	method explotar(position){
		game.addVisualIn(self, position)
		self.existe()
		game.whenCollideDo(self, { alguien => alguien.explotar() })
		
		const explosionN = new ExplosionNorte()
		if(explosionN.hayLugar(position.up(1))){
	    	explosionN.existe()
			game.addVisualIn(explosionN, position.up(1))
			game.whenCollideDo(explosionN, { alguien => alguien.explotar() })	
		}
		game.onTick(500, "sacarExplosion", {	
			game.removeTickEvent("sacarExplosion")}
			)
		}


	method hayLugar( unaOrientacion ) {
  		return 
    	game.getObjectsIn( unaOrientacion ).all { unObj => unObj.esAtravesable() }
	}

}

class ExplosionNorte inherits Explosion {
	override method image() = "ExplosionNorte.png"
}

class ExplosionEste inherits Explosion {
	override method image() = "ExplosionEste.png"
}

class ExplosionSur inherits Explosion {
	override method image() = "ExplosionSur.png"
}

class ExplosionOeste inherits Explosion {
	override method image() = "ExplosionOeste.png"
}

class ExplosionNorteSur inherits Explosion {
	override method image() = "CuerpoExplosionNorteSur.png"
}
class ExplosionEsteOeste inherits Explosion {
	override method image() = "CuerpoExplosionOesteEste.png"
}

object moneda{
	var property position = game.at(1,5)
	method image() = "moneda.png"
	method esMoneda(){ return true}
	method esAtravesable() = true
	method esPowerUp() = false
}

object muro{
   var property position = game.at(0, 1)
	method image() = "muro.png "
	method esMoneda(){ return false}
	method esAtravesable() = false
	method esPowerUp() = false
}

/* 
object bomba{
	var property danio = 20
	method image() = "bomba.png"
	method esMoneda(){ return false}
}*/


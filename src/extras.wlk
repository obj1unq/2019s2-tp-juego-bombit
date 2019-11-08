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
		if (jugador.tienePoder()) { explosion.explotarPowerUp(position) } else { explosion.explotar(position) }
	} 		
	
}

class Explosion {
	
	method image()= "ExplosionCentro.png"
 
    var hayFuego = false
   
	method existe() { hayFuego = not hayFuego }
	
	method explotar(position){
		game.addVisualIn(self, position)
		self.existe()
		game.whenCollideDo(self, { alguien => alguien.explotar() })
		
		const exploN = new ExplosionNorte()
		if(exploN.hayLugar(position.up(1))){
	    exploN.existe()
		game.addVisualIn(exploN, position.up(1))
		game.whenCollideDo(exploN, { alguien => alguien.explotar() })	
		}
		
		const exploS = new ExplosionSur()
		if(exploS.hayLugar(position.down(1))){
	    exploS.existe()
		game.addVisualIn(exploS, position.down(1))
		game.whenCollideDo(exploS, { alguien => alguien.explotar() })
		}
		
		const exploE = new ExplosionEste()
		if(exploE.hayLugar(position.right(1))){
		exploE.existe()
		game.addVisualIn(exploE, position.right(1))
		game.whenCollideDo(exploE, { alguien => alguien.explotar() })
		}
		
		const exploO = new ExplosionOeste()
		if(exploO.hayLugar(position.left(1))){
		exploO.existe()
		game.addVisualIn(exploO, position.left(1))
		game.whenCollideDo(exploO, { alguien => alguien.explotar() })
		}
		
		game.onTick(500, "sacarExplosion", {	
		self.finExplosion()
		exploN.finExplosion()
		exploS.finExplosion()
		exploE.finExplosion()
		exploO.finExplosion()
			game.removeTickEvent("sacarExplosion")
		})
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


object powerUp{
	method image()= "PowerUp.png"
	
	method position()= game.at(7,7)
    
    method agarrarPoder(){
       jugador.agarrarPoder()
    }

/* 
object bomba{
	var property danio = 20
	method image() = "bomba.png"
	method esMoneda(){ return false}
}*/

object moneda{
	var property position = game.at(1,5)
	method image() = "moneda.png"
	method esMoneda(){ return true}
}

object muro{
   var property position = game.at(0, 1)
	method image() = "muro.png "
	method esMoneda(){ return false}
	method esAtravesable() = false
}

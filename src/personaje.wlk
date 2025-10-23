import wollok.game.*
import menu.*
import enemigos.*
import items.*
import src.theBindingOfRocky.juego

class Personaje {
  var property position = game.at(7,0)
  var property spriteBasico = "_basico.png"
  var property spriteAlternativo = "_alternativo.png"
  var property spriteActual = spriteBasico
  var property vida = 10
  var property danio = 3
  var property escudo = 4
  var recargando = false

  method reiniciarStats(){
    position = game.at(7,0)
    spriteActual = spriteBasico
    vida = 10
    danio = 3
    escudo = 2
  }

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method asumirDanio(danioEnemigo){
    vida = vida - (danioEnemigo / escudo).truncate(0)
    if(vida <= 0 ){
      juego.terminarJuego()
    }
  }

  method disparar(sentido){
    if(not recargando){
      const bala = new Proyectil(position = self.position())
      bala.spawnearProyectil(danio)
      if(sentido == "arriba"){
        game.onTick(100, "disparo", {bala.moverBalaArriba()})
      }
      if(sentido == "izquierda"){
        game.onTick(100, "disparo", {bala.moverBalaIzquierda()})
      }
      if(sentido == "derecha"){
        game.onTick(100, "disparo", {bala.moverBalaDerecha()})
      }
      if(sentido == "abajo"){
        game.onTick(100, "disparo", {bala.moverBalaAbajo()})
      }
      recargando = true
      self.recargar()
    }
    
  }

  method recargar(){
    game.schedule(350, {
      recargando = false
    })
  }

  method cambiarSprite(nuevoSprite){
    spriteActual = nuevoSprite
  }
  method image() = spriteActual
}

object blito inherits Personaje{
  override method image() = "" + self + super()
}

object gabi inherits Personaje{
  override method image() = "" + self + super()
}

object tuca inherits Personaje{}

object manu inherits Personaje{}

object facu inherits Personaje{}

class Proyectil {
  var property position = game.origin()
  method image() = "proyectil.png"
  method spawnearProyectil(danioPlayer){
    game.addVisual(self)
    game.onCollideDo(self, {enemigo => 
    enemigo.pegar(self.danio(danioPlayer))
    })
  }
  method danio(danioJugador) = 1 + danioJugador

  method moverBalaArriba(){
    position = position.up(1)
    if(position.y() >= game.height()){
      game.removeVisual(self)
    }
  }
  method moverBalaIzquierda(){
    position = position.left(1)
    if(position.x() < 0){
      game.removeVisual(self)
    }
  }
  method moverBalaAbajo(){
    position = position.down(1)
    if(position.y() < 0){
      game.removeVisual(self)
    }
  }
  method moverBalaDerecha(){
    position = position.right(1)
    if(position.x() >= game.width()){
      game.removeVisual(self)
    }
  }

}
import src.utils.*
import wollok.game.*
import menu.*
import enemigos.*
import items.*
import src.theBindingOfRocky.juego
import salas.*

class Personaje {
  var property position = game.at(7,0)
  var property spriteBasico = "_basico.png"
  var property spriteAlternativo = "_alternativo.png"
  var property spriteActual = spriteBasico
  var property vida = 10
  var property danio = 3
  var property escudo = 4
  var recargando = false
  var idBala = 0

  method reiniciarPosicion(){
    position = game.at(7,0)
  }

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 10
    danio = 3
    escudo = 2
  }
  

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method asumirDanio(danioAsumido){
    vida = vida - ((danio * (1 - (escudo / (escudo + 10))))).truncate(0)
    if(vida <= 0 ){
      juego.terminarJuego()
    }
  }

  method disparar(sentido){
    if(not recargando){
      const bala = new Proyectil(position = self.position())
      bala.spawnearProyectil(danio, idBala)
      game.onTick(100, "Disparo" + idBala.toString(), {
        bala.mover(sentido)
      })
      idBala += 1
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

object arriba{
  method nuevaPosicion(posicionActual) = posicionActual.up(1)
}
object abajo{
  method nuevaPosicion(posicionActual) = posicionActual.down(1)
}
object izquierda{
  method nuevaPosicion(posicionActual) = posicionActual.left(1)
}
object derecha{
  method nuevaPosicion(posicionActual) = posicionActual.right(1)
}

object blito inherits Personaje{
  override method image() = "" + self + super()
}

object gabi inherits Personaje{
  override method image() = "" + self + super()
}

object tuca inherits Personaje{

}

object manu inherits Personaje{}

object facu inherits Personaje{}

class Proyectil {
  var property position = game.origin()
  var property id = 0
  method image() = "proyectil.png"
  method spawnearProyectil(danioPlayer, idBala){
    id = idBala
    game.addVisual(self)
    game.onCollideDo(self, {enemigo => 
    enemigo.pegar(self.danio(danioPlayer))
    })
  }
  method danio(danioJugador) = 1 + danioJugador

  method mover(sentido){
    position = sentido.nuevaPosicion(position)
    if(outOfBounds.verificar(position)){
      game.removeTickEvent("Disparo" + id)
      game.removeVisual(self)
    }
  }
}
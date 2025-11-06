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
  var posicionAnterior = position

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

  method mover(sentido){
    posicionAnterior = position
    position = sentido.nuevaPosicion(position)
  }
  method regresar(){
    position = posicionAnterior
  }

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method asumirDanio(danioAsumido){
    vida = vida - ((danio * (1 - (escudo / (escudo + 10))))).truncate(0)

    spriteVida.actualizarVida(vida)
    
    if(vida <= 0 ){
      juego.terminarJuego()
    }
  }

  method disparar(sentido){
    if(not recargando){
      const bala = new Proyectil(position = self.position(), sprite = "proyectil_" + sentido.toString() + ".png")
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
    game.schedule(350, {recargando = false})
  }

  method pegar(arg0, arg1){}

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
  method nuevaVida(){
    vida = 7
  }
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
  const sprite = "proyectil_izquierda.png"
  method image() = sprite

  method spawnearProyectil(danioPlayer, idBala){
    id = idBala
    game.addVisual(self)

    game.onCollideDo(self, {enemigo => 
      enemigo.pegar(self.danio(danioPlayer), self)
    })
  }

  method destruir(){
        game.removeTickEvent("Disparo" + self.id().toString())
        game.removeVisual(self)
  }

  method danio(danioJugador) = 1 + danioJugador

  method mover(sentido){
    position = sentido.nuevaPosicion(position)
    if(outOfBounds.verificar(position)){
      game.removeTickEvent("Disparo" + self.id().toString())
      game.removeVisual(self)
    }
  }

   method colisionarCon(arg0){}
}

object spriteVida{
  var property vidaActual = 1
  
  var property position = game.at(0, 14) 
  
  method image() = "corazon_" + self.vidaActual().toString() + ".png"
  
  method actualizarVida(nuevaVida) {
    self.vidaActual(nuevaVida)
  }
}
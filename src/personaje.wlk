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

  method reiniciarStats(){
    position = game.at(7,0)
    spriteActual = spriteBasico
    vida = 10
    danio = 3
    escudo = 4
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

  method disparar(){

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
  var property position =

}
import wollok.game.*
import menu.*

class Personaje {
  var property position = game.at(7,0)
  var property spriteBasico = "_basico.png"
  var property spriteAlternativo = "_alternativo.png"
  var property spriteActual = spriteBasico
  var property vida = 10
  var property danio = 3
  var property escudo = 4

  method vida() = vida


  method spawnearPersonaje(){
    position = game.at(7,0)
    //spriteActual = spriteBasico
    vida = 10
    danio = 3
    escudo = 4
  }

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method asumirDanio(danioEnemigo){
    //cambiar sprite a un sprite de golpe capaz?
    vida = vida - (danioEnemigo / escudo).truncate(0)
    if(vida <= 0 ){
      game.removeVisual(self)
      game.addVisual(game_over)
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
  var property spriteGabi = "luis"
  override method image() = spriteGabi + super()
}

object tuca inherits Personaje{}

object manu inherits Personaje{}

object facu inherits Personaje{}

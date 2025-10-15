import wollok.game.*
import utils.*

class Enemigo{
  //var property position = posicionAleatoria.calcular()
  
  method colisionarCon(personaje){
    // bajar vida al personaje
  }

  method tick(){

  }
}

object mosca inherits Enemigo {
  method image() = "mosca.png"
  var property position = posicionAleatoria.calcular()

}
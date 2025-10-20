import wollok.game.*
import utils.*

class Enemigo{
  var property danio = 5
  var property position = posicionAleatoria.calcular()
  var property y = -1
  var property x = -1

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
    // bajar vida al personaje
  }

  method moverArriba(){
    position = position.up(1)
    y = 1
  }

  method moverAbajo(){
    position = position.down(1)
    y = -1
  }

  method moverIzquierda(){
    position = position.left(1)
    x = -1
  }

  method moverDerecha(){
    position = position.right(1)
    x = 1
  }
}

object mosca inherits Enemigo {

  method image() = "mosca.png"
  
  method rebotar (){
      if (self.y() == -1) {
        self.moverArriba()
      } else {
        self.moverAbajo()
      }
  }

}

object cv inherits Enemigo {

  method image() = "mosca.png"

  method circular(){
    if (self.y() == -1) {
        self.moverArriba()
    } else if (self.x() == -1){
        self.moverDerecha()
    } else if (self.y() == 1){
        self.moverAbajo()
    } else if (self.x() == 1){
        self.moverIzquierda()
    }
  }
}
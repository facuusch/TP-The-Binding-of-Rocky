import wollok.game.*
import utils.*

class Enemigo{
  var property danio = 5
  var property position = posicionAleatoria.calcular()

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
  }

}

object mosca inherits Enemigo {

  //var property y = -1

  method image() = "mosca.png"

  method moverArriba(){
    position = position.up(1)
    //y = 1
  }

  method moverAbajo(){
    position = position.down(1)
    //y = -1
  }

  // method rebotar (){
  //     if (self.y() == -1) {
  //       self.moverArriba()
  //     } else {
  //       self.moverAbajo()
  //     }
  // }

  method rebotar(){
    game.schedule(200, {self.moverArriba()})
    game.schedule(400, {self.moverAbajo()})

  }
}

object cv inherits Enemigo {

  method image() = "cv.png"

  var property z = 1
  method moverArriba(){
    position = position.up(1)
    z = 2
  }

  method moverAbajo(){
    position = position.down(1)
    z = 4
  }

  method moverIzquierda(){
    position = position.left(1)
    z = 1
  }

  method moverDerecha(){
    position = position.right(1)
    z = 3
  }

  method circular(){
    if (self.z() == 1) {
        self.moverArriba()
    } else if (self.z() == 2){
        self.moverDerecha()
    } else if (self.z() == 3){
        self.moverAbajo()
    } else if (self.z() == 4){
        self.moverIzquierda()
    }
  }
}
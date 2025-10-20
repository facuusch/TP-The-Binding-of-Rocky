import wollok.game.*
import utils.*

class Enemigo{
  var property danio = 5
  var property position = posicionAleatoria.calcular()

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
    
    
    // bajar vida al personaje
  }

  // method tick(){

  // }
}

object mosca inherits Enemigo {

  method image() = "mosca.png"
  var property y = -1

  method rebotar (){
      if (self.y() == -1) {
        self.moverArriba()
      } else {
        self.moverAbajo()
      }
  }

  method moverArriba(){
    position = position.up(1)
    y = 1
  }

  method moverAbajo(){
    position = position.down(1)
    y = -1
  }
  
  //override method onTick() {}
}


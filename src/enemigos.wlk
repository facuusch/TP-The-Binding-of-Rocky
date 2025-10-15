import wollok.game.*
import utils.*

class Enemigo{
  var property danio = 3

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
    
    // bajar vida al personaje
  }

  method tick(){

  }
}

object mosca inherits Enemigo {
  // Define la velocidad y dirección de la mosca
  //var velocidadY = 1
  var property position = posicionAleatoria.calcular()
  method image() = "mosca.png"
  
  //override method onTick() {}
  }

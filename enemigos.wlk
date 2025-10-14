import wollok.game.*
import utils.*

class Enemigos{
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon(personaje){
    // bajar vida al personaje
  }

  method onTick(){

  }
}

object mosca inherits Enemigo {


  method image() { 
    return "mosca.png"


  }
}
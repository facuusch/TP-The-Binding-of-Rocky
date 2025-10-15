import wollok.game.*
import utils.*

class Enemigo{
  
  method colisionarCon(personaje){
    // bajar vida al personaje
  }

  method tick(){

  }
}

object mosca inherits Enemigo {
  
  method image() = "mosca.png"
  
  override method onTick() {
 
}
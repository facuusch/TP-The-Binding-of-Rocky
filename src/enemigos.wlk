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
  // Define la velocidad y dirección de la mosca
  //var velocidadY = 1
  var property position = posicionAleatoria.calcular()
  method image() = "mosca.png"
  
  // onTick() es donde se actualiza el movimiento de la mosca
  // override method onTick() {
  //   const nuevaY = self.position().y() + velocidadY
    
  //   // Cambia de dirección si llega a los bordes de la pantalla
  //   if (nuevaY <= 0 || nuevaY >= game.height()) {
  //     velocidadY = -velocidadY
  //   }
    
  //   // Actualiza la posición de la mosca
  //   self.position(self.position().x(), nuevaY)
  // }
}
import wollok.game.*
import utils.*

class Enemigo{
 var property position = posicionAleatoria.calcular()
 
 method onTick() {
  // Las subclases deben implementar la lógica de movimiento aquí
 }
 method colisionarCon(personaje) {
 // coso para bajarle vida al personaje
 }

}

object mosca inherits Enemigo {
  // Define la velocidad y dirección de la mosca
  var velocidadY = 1
  
  method image() { 
    return "mosca.png"
  }
  
  // onTick() es donde se actualiza el movimiento de la mosca
  override method onTick() {
    const nuevaY = self.position().y() + velocidadY
    
    // Cambia de dirección si llega a los bordes de la pantalla
    if (nuevaY <= 0 || nuevaY >= game.height()) {
      velocidadY = -velocidadY
    }
    
    // Actualiza la posición de la mosca
    self.position(self.position().x(), nuevaY)
  }
}
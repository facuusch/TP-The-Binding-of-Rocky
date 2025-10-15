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
  
  method image() { 
    return "mosca.png"
  }
  

  override method onTick() {
 
}
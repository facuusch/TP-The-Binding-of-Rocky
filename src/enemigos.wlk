import wollok.game.*
import utils.*
import salas.*
import src.theBindingOfRocky.juego

class Enemigo{
  var property vida = 6
  var property danio = 5
  var property position = posicionAleatoria.calcular()
  //const salas = [sala_1, sala_2, sala_3]
  //var property salaActual = 0

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
  }

  method pegar(danioPlayer){
    vida -= danioPlayer
    if(vida <= 0){
      game.removeVisual(self)
      juego.chequearTerminada()
    }
  }

}

object mosca inherits Enemigo {

  var property y = -1

  method image() = "mosca.png"

  method moverArriba(){
    position = position.up(1)
    y = 1
  }

  method moverAbajo(){
    position = position.down(1)
    y = -1
  }

   method rebotar (){
       if (self.y() == -1) {
         self.moverArriba()
       } else {
         self.moverAbajo()
       }
   }

  // method rebotar(){
  //   game.schedule(200, {self.moverArriba()})
  //   game.schedule(400, {self.moverAbajo()})

  // }
}

object cv inherits Enemigo {

  method image() = "cv.png"
 // method rebotar(){
  //   game.schedule(200, {self.moverArriba()})
  //   game.schedule(400, {self.moverAbajo()})

  // }
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
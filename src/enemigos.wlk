import wollok.game.*
import utils.*
import salas.*
import src.theBindingOfRocky.juego
import personaje.*

class Enemigo{
  var property vida = 6
  var property danio = 5
  var property position = posicionAleatoria.calcular()
  var property id = 0

  method colisionarCon(personaje){
    personaje.asumirDanio(danio)
  }

  method pegar(danioPlayer){
    vida -= danioPlayer
    if(vida <= 0){
      game.removeVisual(self)
      game.removeTickEvent("moverEnemigo" + id)
      juego.chequearTerminada()
    }
  }

  method movimiento(){}

  method agregarEnemigo(enemigos){
    game.addVisual(self)
    enemigos.add(self)
    game.onTick(800, "moverEnemigo" + id.toString(), {self.movimiento()})
   }

}

class Mosca inherits Enemigo {
  var property posicionInicial = position
  var property posicionAnterior = position
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
  method mover(sentido){
    posicionAnterior = position
    position = sentido.nuevaPosicion(position)

    if(outOfBounds.verificar(position)){
      position = posicionAnterior
    }
  }

   method rebotarVieja (){
       if (self.y() == -1) {
         self.moverArriba()
       } else {
         self.moverAbajo()
       }
   }

   override method movimiento(){
     if(position.y() == (posicionInicial.y() - 1)){
      self.mover(arriba)
     } else{
      self.mover(abajo)
     }
   }

   
}

class Cv inherits Enemigo {

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

  override method movimiento(){
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
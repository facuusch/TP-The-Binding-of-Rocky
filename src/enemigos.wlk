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


class NuevoMonstruoA inherits Enemigo {

  method image() = "monstruoA.png"

  //dirección actual
  var property direccion = 1

  //puntos clave del recorrido
  var property inicio = game.at(0, 14)
  var property medio = game.at(7, 8)
  var property fin = game.at(14, 14)

  method posInicial() {
    position = inicio
  }

  method moverDiagonal(dx, dy) {
    const nuevaPos = position.add(dx, dy)
    if (not outOfBounds.verificar(nuevaPos)) {
      position = nuevaPos
    }
  }

  override method movimiento() {

    //movimiento en forma de V: (0,14) a (7,8) a (14,14) y vuelve
    if (direccion == 1) {
      //baja hacia la derecha
      self.moverDiagonal(1, -1)

      //llegó al punto medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y()) {
        direccion = 2
      }

    } 
    
    else if (direccion == 2) {
      //sube hacia la derecha
      self.moverDiagonal(1, 1)

      //llegó al final (14,14) y cambia sentido
      if (position.x() == fin.x() and position.y() == fin.y()) {
        direccion = -2
      }

    } 
    
    else if (direccion == -2) {
      //baja hacia la izquierda
      self.moverDiagonal(-1, -1)

      //volvió al medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y()) {
        direccion = -1
      }

    } 
    
    else if (direccion == -1) {
      //sube hacia la izquierda
      self.moverDiagonal(-1, 1)

      //volvió al inicio y reinicia el ciclo
      if (position.x() == inicio.x() and position.y() == inicio.y()) {
        direccion = 1
      }
    }
  }
}


class NuevoMonstruoB inherits Enemigo {

  method image() = "monstruoB.png"

  //dirección actual
  var property direccion = 1

  //puntos clave del recorrido
  var property inicio = game.at(14, 0)
  var property medio = game.at(7, 8)
  var property fin = game.at(0, 0)

  method posInicial() {
    position = inicio
  }

  method moverDiagonal(dx, dy) {
    const nuevaPos = position.add(dx, dy)
    if (not outOfBounds.verificar(nuevaPos)) {
      position = nuevaPos
    }
  }

  override method movimiento() {

    //movimiento en forma de V invertida: (14,0) a (7,8) a (0,0) y vuelve
    if (direccion == 1) {
      // sube hacia la izquierda
      self.moverDiagonal(-1, 1)

      //llegó al punto medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y()) {
        direccion = 2
      }

    } 
    
    else if (direccion == 2) {
      //baja hacia la izquierda
      self.moverDiagonal(-1, -1)

      //llegó al final (0,1) y cambia sentido
      if (position.x() == fin.x() and position.y() == fin.y()) {
        direccion = -2
      }

    } 
    
    else if (direccion == -2) {
      //sube hacia la derecha
      self.moverDiagonal(1, 1)

      //volvió al medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y()) {
        direccion = -1
      }

    } 
    
    else if (direccion == -1) {
      //baja hacia la derecha
      self.moverDiagonal(1, -1)

      //volvió al inicio y reinicia el ciclo
      if (position.x() == inicio.x() and position.y() == inicio.y()) {
        direccion = 1
      }
    }
  }
}
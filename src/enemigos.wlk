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

  method pegar(danioPlayer, bala){
    vida -= danioPlayer
    if(vida <= 0){
      game.removeVisual(self)
      game.removeTickEvent("moverEnemigo" + self.id().toString())
      juego.chequearTerminada()
    }

    bala.destruir()
  }

  method movimiento(){}

  method agregarEnemigo(enemigos){
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
    throw new Exception(message = "Error interno: El enemigo Mosca intentó salir del mapa.")
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

class Cv inherits Enemigo(vida = 10) {

  method image() = "cv.png"
  var property z = 1
  method moverArriba(){
  if(outOfBounds.verificar(self.position())){
  throw new Exception(message = "Error interno: El enemigo Cv intentó salir del mapa.")
  }
    position = position.up(1)
    z = 2
  }

  method moverAbajo(){
 if(outOfBounds.verificar(self.position())){
  throw new Exception(message = "Error interno: El enemigo Cv intentó salir del mapa.")
  }
    position = position.down(1)
    z = 4
  }

  method moverIzquierda(){
 if(outOfBounds.verificar(self.position())){
  throw new Exception(message = "Error interno: El enemigo Cv intentó salir del mapa.")
  }
    position = position.left(1)
    z = 1
  }

  method moverDerecha(){
 if(outOfBounds.verificar(self.position())){
  throw new Exception(message = "Error interno: El enemigo Cv intentó salir del mapa.")
  }
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


class Mostro inherits Enemigo (vida = 12) {

  method image() = "mostro.png"

  //dirección actual
  var property direccion = 1
  //puntos clave del recorrido
  var property inicio = game.at(0, 14)
  var property medio = game.at(7, 8)
  var property fin = game.at(14, 14)


  method moverDiagonal(dx, dy) {
    const nuevaPos = game.at(self.position().x() + dx, self.position().y() + dy)

    if (not outOfBounds.verificar(nuevaPos)){ 
      position = nuevaPos
      return false
    } 
    else {
    return not false
    }
  }

  override method movimiento() {
    var afuera
    //movimiento en forma de V: (0,14) a (7,8) a (14,14) y vuelve
    if (direccion == 1) {
      //baja hacia la derecha
      afuera = self.moverDiagonal(1, -1)

      //llegó al punto medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y() or afuera) {
        direccion = 2
      }

    } 
    
    else if (direccion == 2) {
      //sube hacia la derecha
      afuera = self.moverDiagonal(1, 1)

      //llegó al final (14,14) y cambia sentido
      if (position.x() == fin.x() and position.y() == fin.y() or afuera) {
        direccion = -2
      }

    } 
    
    else if (direccion == -2) {
      //baja hacia la izquierda
      afuera = self.moverDiagonal(-1, -1)

      //volvió al medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y() or afuera) {
        direccion = -1
      }

    } 
    
    else if (direccion == -1) {
      //sube hacia la izquierda
      afuera = self.moverDiagonal(-1, 1)

      //volvió al inicio y reinicia el ciclo
      if (position.x() == inicio.x() and position.y() == inicio.y() or afuera) {
        direccion = 1
      }
    }
  }
}


class Mostra inherits Enemigo (vida = 12){

  method image() = "mostro.png"

  //dirección actual
  var property direccion = 1
  //puntos clave del recorrido
  var property inicio = game.at(0, 14)
  var property medio = game.at(7, 8)
  var property fin = game.at(14, 14)


  method moverDiagonal(dx, dy) {
    const nuevaPos = game.at(self.position().x() + dx, self.position().y() + dy)

    if (not outOfBounds.verificar(nuevaPos)){
      position = nuevaPos
      return false
    } 
    else {
    return not false
    }
  }

  override method movimiento() {
    var afuera
    //movimiento en forma de V: (0,14) a (7,8) a (14,14) y vuelve
    if (direccion == 1) {
      //sube hacia la derecha
      afuera = self.moverDiagonal(1, 1)

      //llegó al final (14,14) y cambia sentido
      if (position.x() == fin.x() and position.y() == fin.y() or afuera) {
        direccion = -1
      }

    } 
    
    else if (direccion == -1) {
      //baja hacia la derecha
      afuera = self.moverDiagonal(1, -1)

      //llegó al punto medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y() or afuera) {
        direccion = -2
      }
    } 
    
    else if (direccion == -2) {
      //sube hacia la izquierda
      afuera = self.moverDiagonal(-1, 1)

      //volvió al inicio y reinicia el ciclo
      if (position.x() == inicio.x() and position.y() == inicio.y() or afuera) {
        direccion = 2
      }
    }
    
    else if (direccion == 2) {
      //baja hacia la izquierda
      afuera = self.moverDiagonal(-1, -1)

      //volvió al medio (7,8)
      if (position.x() == medio.x() and position.y() == medio.y() or afuera) {
        direccion = 1
      }

    } 
  }
}

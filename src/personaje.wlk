import src.utils.*
import wollok.game.*
import menu.*
import enemigos.*
import items.*
import src.theBindingOfRocky.juego
import salas.*

class Personaje {
  var property position = game.at(7,0)
  var property spriteBasico = "_basico.png"
  var property spriteAlternativo = "_alternativo.png"
  var property spriteActual = spriteBasico
  var property vida = 10
  var property danio = 3
  var property escudo = 2
  var recargando = false
  var idBala = 0
  var posicionAnterior = position

  method spriteBala() = ""

  method reiniciarPosicion(){
    position = game.at(7,0)
  }

  method mover(sentido){
    posicionAnterior = position
    const nuevaPosicion = sentido.nuevaPosicion(position)
    //game.getObjectsIn(nuevaPosicion)
    position = nuevaPosicion
  }
  method regresar(){
    position = posicionAnterior
  }

  method agarrarItemBasico(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method agarrarItemStats(item){
    game.removeVisual(item)
    item.cambiarStats(self)
  }

  method asumirDanio(danioAsumido){
    vida = vida - ((danio * (1 - (escudo / (escudo + 10))))).truncate(0)

    spriteVida.actualizarVida(vida)
    
    if(vida <= 0 ){
      juego.terminarJuego()
    }
  }

  method disparar(sentido){
    if(not recargando){
      const nombreBase = self.spriteBala()

      const spriteCompleto = nombreBase + "_" + sentido.toString() + ".png"

      const proyectil = new Proyectil(position = self.position())

      proyectil.spawnearProyectil(danio, idBala, spriteCompleto)

      game.onTick(100, "Disparo" + idBala.toString(), {
        proyectil.mover(sentido)
      })

      idBala += 1
      recargando = true
      self.recargar()
    }
    
  }

  method recargar(){
    game.schedule(350, {recargando = false})
  }

  method pegar(arg0, arg1){}

  method cambiarSprite(nuevoSprite){
    spriteActual = nuevoSprite
  }
  method image() = spriteActual
}

object arriba{
  method nuevaPosicion(posicionActual) = posicionActual.up(1)
}
object abajo{
  method nuevaPosicion(posicionActual) = posicionActual.down(1)
}
object izquierda{
  method nuevaPosicion(posicionActual) = posicionActual.left(1)
}
object derecha{
  method nuevaPosicion(posicionActual) = posicionActual.right(1)
}

object blito inherits Personaje(vida = 7, danio = 3){
  override method image() = "" + self + super()

  override method spriteBala() = "cuchillo"

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 7
    danio = 3
  }
}

object gabi inherits Personaje(vida = 4, danio = 6){
  override method image() = "" + self + super()

  override method spriteBala() = "bala"

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 4
    danio = 6
  }
}

object tuca inherits Personaje(vida= 6, danio = 4){
  override method image() = "" + self + super()

  override method spriteBala() = "nose"

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 6
    danio = 4
  }
}

object manu inherits Personaje(vida = 8, danio = 2){
  override method image() = "" + self + super()

  override method spriteBala() = "nota"

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 8
    danio = 2
  }
}

object facu inherits Personaje(vida = 5, danio = 5){
  override method image() = "" + self + super()

  override method spriteBala() = "nose"

  method reiniciarStats(){
    self.reiniciarPosicion()
    spriteActual = spriteBasico
    vida = 5
    danio = 5
  }
}

class Proyectil {
  var property position = game.origin()
  var property id = 0
  var property  sprite = "bala.png"
  method image() = sprite

  method spawnearProyectil(danioPlayer, idBala, spriteCompleto){
    id = idBala
    self.sprite(spriteCompleto)
    game.addVisual(self)

    game.onCollideDo(self, {enemigo => 
      enemigo.pegar(self.danio(danioPlayer), self)
    })
  }

  method destruir(){
        game.removeTickEvent("Disparo" + self.id().toString())
        game.removeVisual(self)
  }

  method danio(danioJugador) = 1 + danioJugador

  method mover(sentido){
    position = sentido.nuevaPosicion(position)
    if(outOfBounds.verificar(position)){
      game.removeTickEvent("Disparo" + self.id().toString())
      game.removeVisual(self)
    }
  }

   method colisionarCon(arg0){}
}

object spriteVida{
  var property vidaActual = 1
  
  var property position = game.at(0, 14) 
  
  method image() = "corazon_" + self.vidaActual().toString() + ".png"
  
  method actualizarVida(nuevaVida) {
    self.vidaActual(nuevaVida)
  }

  method pegar(arg0, arg1){}
  method colisionarCon(arg0){}
}


object spriteDanio{
  var property danioActual = 1
  
  var property position = game.at(0, 14) 

  //apareceria como una barra de fuerza?? al igual que con el escudo?? 
  //hacer eso o cambiar la apariencia del personaje cuando por ejemplo supere los 6 de danio
  method image() = "musculo_" + self.danioActual().toString() + ".png"
  
  method actualizarDanio(nuevoDanio) {
    self.danioActual(nuevoDanio)
  }

  method pegar(arg0, arg1){}
  method colisionarCon(arg0){}
}
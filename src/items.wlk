import src.personaje.*
import wollok.game.*
import utils.*

class Item {
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon (personaje){
    personaje.agarrarItemStats(self)
  }
}

//esto seria para el item que modifica el sprite pero no tengo los sprites alternativos aun :(
class ItemBasico inherits Item{
  override method colisionarCon (personaje){
    personaje.agarrarItemBasico(self)
    game.say(personaje, "Agarre el item: " + self)
  }
}

class ItemVida inherits Item{
  const vidaExtra = 3
  var vidaActual = 0

  method cambiarStats(personaje){
    vidaActual = personaje.vida()
    vidaActual += vidaExtra
    if(vidaActual > 10){
      vidaActual = 10
    }
    personaje.vida(vidaActual)
    spriteVida.actualizarVida(vidaActual)
  }
}

class ItemDanio inherits Item{
  const danioExtra = 3
  var danioActual = 0
  
  method cambiarStats(personaje){
    danioActual = personaje.danio()
    danioActual += danioExtra

  //le puse un limitante momentaneo que despues definiremos bien
  if(danioActual > 8){ 
      danioActual = 8
     }
    personaje.danio(danioActual)
    spriteDanio.actualizarDanio(danioActual)
  }
}

object oktubre inherits ItemVida{
  method image() = "oktubre.png"
  override method colisionarCon(personaje){
    personaje.agarrarItemStats(self)
    const sonido = game.sound("oktubre.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}

object hamburguesa inherits ItemVida{
  method image() = "hamburguesa.png"
  override method colisionarCon(personaje){
    personaje.agarrarItemStats(self)
    const sonido = game.sound("hamburguesa.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}

object brocoli inherits ItemDanio{
  method image() = "brocoli.png"
  override method colisionarCon(personaje){
    personaje.agarrarItemStats(self)
    const sonido = game.sound("brocoli.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}

object arma inherits ItemBasico{
  method image() = "pistola.png"
}
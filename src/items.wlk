import src.personaje.*
import wollok.game.*
import utils.*
import src.theBindingOfRocky.juego

class Item {
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon (personaje){
    personaje.agarrarItemStats(self)
  }
}


object itemBasico inherits Item{
  var imagen = ""
  method image() = imagen
  var sonido = game.sound("")


  method setearImagenSonido(nombrePersonaje){
    imagen = "item_" + nombrePersonaje.toString() + ".png"
    sonido = game.sound(nombrePersonaje.toString() + ".mp3")
    sonido.volume(0.2)
  }

  override method colisionarCon (personaje){
    personaje.agarrarItemBasico(self)
    sonido.play()
  }
}

class ItemVida inherits Item{
  const vidaExtra = 3
  var vidaActual = 0
  var vidaProvisoria = 0
  method cambiarStats(personaje){
    vidaActual = personaje.vida()
    vidaProvisoria = vidaExtra + vidaActual
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
  }
}

object empanada inherits ItemVida{
  method image() = "empanada.png"
  override method colisionarCon(personaje){
    personaje.agarrarItemStats(self)
    if (vidaProvisoria>10){game.say(personaje, "Mi vida alcanzó el máximo posible: 10")}
    const sonido = game.sound("comer.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}

object hamburguesa inherits ItemVida{
  method image() = "hamburguesa.png"
  override method colisionarCon(personaje){
    personaje.agarrarItemStats(self)
    if (vidaProvisoria>10){game.say(personaje, "Mi vida alcanzó el máximo posible: 10")}
    const sonido = game.sound("comer.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}

//como solo hay un item de daño lo representamos con un objeto
object brocoli inherits Item{
  method image() = "brocoli.png"
  const danioExtra = 3
  var danioActual = 0
  var danioProvisorio = 0

  method cambiarStats(personaje){
    danioActual = personaje.danio()
    danioProvisorio = danioExtra + danioActual
    danioActual += danioExtra
    
  //le puse un limitante momentaneo que despues definiremos bien
  if(danioActual > 8){ 
      danioActual = 8
     }
    personaje.danio(danioActual)
  }

  override method colisionarCon(personaje){
  
    personaje.agarrarItemStats(self)
    
    if (danioProvisorio<=8){game.say(personaje, "Mi daño es: " + personaje.danio())}
    else if (danioProvisorio>8){game.say(personaje, "Mi daño alcanzó el máximo posible: 8")}
  
    const sonido = game.sound("comer.mp3")
    sonido.volume(0.2)
    sonido.play()
  }
}
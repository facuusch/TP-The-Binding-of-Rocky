import wollok.game.*


class Personaje {
  var property position = game.origin()
  var property spriteBasico = "_basico.png"
  var property spriteAlternativo = "_armado.png"

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite(spriteAlternativo)
  }

  method cambiarSprite(nuevoSprite){
    //sprite = nuevoSprite
  }

  method agarrarPistola(elemento){
    //sprite = elemento + "_pistola.png"
  }

  method image() = spriteBasico
}

object blito inherits Personaje{
  var property spriteBlito = "blito"
  // override method image() = spriteBlito + super()
  override method image() = "" + self + super()
  //override var property sprite = "blito_basico.png"
}

object gabi inherits Personaje{}

object tuca inherits Personaje{}

object manu inherits Personaje{}

object facu inherits Personaje{}

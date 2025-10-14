import wollok.game.*


class Personaje {
  var property position = game.origin()
  var property sprite = "blito_basico_50px.png"

  method agarrarItem(item){
    game.removeVisual(item)
    self.cambiarSprite("luispistolero.png")
    game.say(self, "Agarre: pistolubi")
  }

  method cambiarSprite(nuevoSprite){
    sprite = nuevoSprite
  }

  method image() = sprite
}

object luis inherits Personaje{}

object blito inherits Personaje{}
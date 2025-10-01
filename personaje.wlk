import wollok.game.*

object luis {
  var property position = game.origin()

  method agarrarArma(pistola){
  game.removeVisual(pistola)
  game.removeVisual(luis)
  game.addVisualCharacter(luispistolero)
  game.say(self, "Agarre: pistolubi")
  }

  method image() = "luis.png"
  method iamge() = "luispistolero.png"
}
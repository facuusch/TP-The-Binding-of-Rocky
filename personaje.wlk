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
    //game.refreshVisual(self)
  }

  method image() = sprite
}

const luis = new Personaje()


//object luis {
  // var property position = game.origin()
  // var property sprite = "luis.png"

  // method agarrarArma(pistola){
  // game.removeVisual(pistola)
  // luis.cambiarSprite()
  // game.say(self, "Agarre: pistolubi")
  // }

  // method cambiarSprite(){
  //   sprite = "luispistolero.png"
  // }


  //method image() = sprite
  //method image() = "luis.png"
  //method iamge() = "luispistolero.png"
//}
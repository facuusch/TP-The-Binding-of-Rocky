import wollok.game.*
import utils.*

class Item {
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon (personaje){
    personaje.agarrarItem(self)
    game.say(self, "bbb")
  }
}

class ItemBasico {

}

object pistola inherits Item{
  method image() = "pistola.png"
}
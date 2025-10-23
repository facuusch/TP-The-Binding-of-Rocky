import wollok.game.*
import utils.*

class Item {
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon (personaje){
    personaje.agarrarItem(self)
    game.say(personaje, "Agarre el item: " + self)
  }
}

class ItemBasico inherits Item{

}

class ItemVida inherits Item{
  var property vidaExtra = 3
}

object arma inherits ItemBasico{
  method image() = "pistola.png"
}
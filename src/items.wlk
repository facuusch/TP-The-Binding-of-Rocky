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
  var property vidaExtra = 3
  override method colisionarCon (personaje){
    personaje.agarrarItemStats(self)
  }
  method cambiarStats(personaje){
    personaje.vida().sumarStat(vidaExtra)
  }
}

object oktubre inherits ItemVida{

}

object arma inherits ItemBasico{
  method image() = "pistola.png"
}
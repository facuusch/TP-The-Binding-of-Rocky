import wollok.game.*
import utils.*

object pistola {
  var property position = posicionAleatoria.calcular()
  
  method colisionarCon (luis){
    luis.colisionarCon(luis)
  }

  method image() = "pistola.png"
}
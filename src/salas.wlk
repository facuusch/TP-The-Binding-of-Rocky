import wollok.game.*
import utils.*

object puerta{
    var property position = game.at(7,14)

    method colisionarCon(personaje){
        
    }
}

object pincho{
    var property position = posicionAleatoria.calcular()

    method colisionarCon(personaje){
        personaje.asumirDanio(3)
    }
}
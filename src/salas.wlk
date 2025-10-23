import src.menu.*
import wollok.game.*
import utils.*
import enemigos.*
import src.theBindingOfRocky.juego

class Sala{

}

object puerta{
    var property position = game.at(7,14)
    method image() = "puerta.png"

    method colisionarCon(personaje){
        personaje.reiniciarPosicion()
        juego.pasarNivel()
    }
    // method colisionarCon(personaje){
    //     game.addVisual(pantallaWin)
    // }
}

object pincho{
    var property position = posicionAleatoria.calcular()

    method colisionarCon(personaje){
        personaje.asumirDanio(3)
    }
}

object sala_1 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_1.png"
    const enemigos = [mosca, cv]
    var vacia = false

    method cargarSala(){
        game.addVisual(mosca)
        game.addVisual(cv)
        game.onTick(800, "moverMosca", {mosca.rebotar()})
        game.onTick(1500, "moverCv", {cv.circular()})
    }

    method chequearVacia(){
        vacia = enemigos.all({ enemigo => not game.hasVisual(enemigo) })
        if(vacia){
            game.addVisual(puerta)
        }
    }
}
object sala_2 inherits Sala(){
    method image() = "sala_2.png"
    var vacia = false
    const enemigos = [mosca, cv]

    method chequearVacia(){
        vacia = enemigos.all({ enemigo => not game.hasVisual(enemigo) })
        if(vacia){
            game.addVisual(puerta)
        }
    }
}
object sala_3 inherits Sala(){
    method image() = "sala_3.png"
    var vacia = false
    const enemigos = [mosca, cv]

    method chequearVacia(){
        vacia = enemigos.all({ enemigo => not game.hasVisual(enemigo) })
        if(vacia){
            game.addVisual(puerta)
        }
    }
}

import src.menu.*
import wollok.game.*
import utils.*
import enemigos.*
import src.theBindingOfRocky.juego

class Sala{
    const enemigos = []
    var vacia = false
    method chequearVacia(){
        vacia = enemigos.all({ enemigo => not game.hasVisual(enemigo) })
        if(vacia){
            game.addVisual(puerta)
        }
    }
}

object puerta{
    var property position = game.at(7,14)
    method image() = "trampilla.png"

    method colisionarCon(personaje){
        personaje.reiniciarPosicion()
        game.removeVisual(personaje)
        juego.pasarNivel()
        game.addVisual(personaje)
    }
}

class Pincho{
    var property position = posicionAleatoria.calcular()
    method image() = "pincho.png"

    method colisionarCon(personaje){
        personaje.asumirDanio(2)
    }
}

object sala_1 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_1.png"
    const pincho1 = new Pincho(position = game.at(1,1))
    const pincho2 = new Pincho(position = game.at(1,13))
    const pincho3 = new Pincho(position = game.at(13,13))
    const pincho4 = new Pincho(position = game.at(13,1))

    method cargarSala(){
        const mosca1 = new Mosca(id = 1)
        mosca1.agregarEnemigo(enemigos)
        const cv1 = new Cv(id = 2)
        cv1.agregarEnemigo(enemigos)
        const mosca2 = new Mosca(id = 3)
        mosca2.agregarEnemigo(enemigos)
        
        game.addVisual(pincho1)
        
        game.addVisual(pincho2)
        
        game.addVisual(pincho3)
        
        game.addVisual(pincho4)
    }

    method borrarSala(){
        game.removeVisual(pincho1)
        game.removeVisual(pincho2)
        game.removeVisual(pincho3)
        game.removeVisual(pincho4)
    }

}
object sala_2 inherits Sala(){
    method image() = "sala_2.png"

    method cargarSala(){
        const mosca1 = new Mosca()
        game.addVisual(mosca1)
        enemigos.add(mosca1)
    }

    method borrarSala(){

    }
}
object sala_3 inherits Sala(){
    method image() = "sala_3.png"

    method cargarSala(){
        const mosca1 = new Mosca()
        game.addVisual(mosca1)
        enemigos.add(mosca1)
    }
}

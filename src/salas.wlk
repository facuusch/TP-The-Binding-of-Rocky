import src.menu.*
import wollok.game.*
import utils.*
import enemigos.*
import src.theBindingOfRocky.juego
import items.*


//0 vacio
//1 pared
//2 pincho
//3 mosca
//4 cv

class Sala{
    const enemigos = []
    const obstaculos = []
    var vacia = false

    method chequearVacia(){
        vacia = enemigos.all({ enemigo => not game.hasVisual(enemigo) })
        if(vacia){
            game.addVisual(puerta)
        }
    }

    method dibujarLineaDeElementos(posicionY, vectorFila) {
		(0..vectorFila.size()-1).forEach({x=>  //no se porque tiene dos puntos confien nomas
            const tipo = vectorFila.get(x)
            if(tipo > 0){
                self.agregarElementoEn(x, posicionY, tipo)
            }
		})
    }

    method agregarElementoEn(x, y, tipo){
        var elemento
        if(tipo == 1){
            elemento = new Pared(position = game.at(x,y))
            obstaculos.add(elemento)
        }
        if(tipo == 2){
            elemento = new Pincho(position = game.at(x,y))
            obstaculos.add(elemento)
        }
        if(tipo == 3){
            elemento = new Mosca(position = game.at(x,y), id = enemigos.size())
            elemento.agregarEnemigo(enemigos)
        }
        if(tipo == 4){
            elemento = new Cv(position = game.at(x,y), id = enemigos.size())
            elemento.agregarEnemigo(enemigos)
        }
        if(tipo == 5){
            elemento = new Mostro(position = game.at(x,y), id = enemigos.size())
            elemento.agregarEnemigo(enemigos)
        }
        if(tipo == 6){
            elemento = oktubre
            elemento.position(game.at(x, y))
            obstaculos.add(elemento)
        }

        if(elemento != null){
            game.addVisual(elemento)
        }
    }

    method borrarElementos() {
        obstaculos.forEach({ obstaculo => 
        if(game.hasVisual(obstaculo)){
            game.removeVisual(obstaculo)
        }})
        obstaculos.clear()

        enemigos.forEach({ enemigo => 
        if(game.hasVisual(enemigo)){
            game.removeVisual(enemigo)
        }})
        enemigos.clear()
    }
    method pegar(arg0, arg1){}
    method colisionarCon(arg0){}
}

class Pared{
	var property position
    method image() = "pared.png"
    method pegar(danioPlayer, bala){
        bala.destruir()
    }
    method colisionarCon(personaje){
        personaje.regresar()
        //devolver al player a su posicion previa
    }
}

object puerta{
    var property position = game.at(7,13)
    method image() = "trampilla.png"

    method colisionarCon(personaje){
        personaje.reiniciarPosicion()
        game.removeVisual(personaje)
        juego.pasarNivel()
        game.addVisual(personaje)
        game.removeVisual(self)
    }
}

class Pincho{
    var property position
    method image() = "pincho.png"

    method colisionarCon(personaje){
        personaje.asumirDanio(2)
    }
    method pegar(arg0, arg1){}
}

object sala_1 inherits Sala(){
    var property position = game.origin()

    method image() = "sala_1.png"

    method cargarSala(){
        self.dibujarLineaDeElementos(14,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(13,    [0,2,0,0,0,0,0,0,0,0,0,0,0,2,0])
        self.dibujarLineaDeElementos(12,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(11,    [0,0,0,0,0,0,0,6,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(10,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(9,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(8,     [0,0,0,3,0,0,0,1,0,0,0,3,0,0,0])
        self.dibujarLineaDeElementos(7,     [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(6,     [0,0,0,0,0,1,1,0,1,1,0,0,0,0,0])
        self.dibujarLineaDeElementos(5,     [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(4,     [0,0,0,3,0,0,0,1,0,0,0,3,0,0,0])
        self.dibujarLineaDeElementos(3,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])  
        self.dibujarLineaDeElementos(2,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(1,     [0,2,0,0,0,0,0,0,0,0,0,0,0,2,0])
        self.dibujarLineaDeElementos(0,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])

	}

    method borrarSala(){
        self.borrarElementos()
    }

}
object sala_2 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_2.png"

    method cargarSala(){
        self.dibujarLineaDeElementos(14,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(13,    [0,0,0,0,0,0,0,0,0,3,0,0,0,0,0])
        self.dibujarLineaDeElementos(12,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(11,    [0,0,0,0,2,2,2,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(10,    [0,0,0,1,0,0,0,1,0,0,0,1,0,0,0])
        self.dibujarLineaDeElementos(9,     [0,0,0,0,0,4,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(8,     [0,0,0,0,0,0,0,0,0,2,0,0,0,0,0])
        self.dibujarLineaDeElementos(7,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(6,     [0,0,0,1,0,0,0,1,0,0,0,1,0,0,0])
        self.dibujarLineaDeElementos(5,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(4,     [0,0,0,0,0,2,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(3,     [0,0,0,0,0,0,0,0,0,4,0,0,0,0,0])  
        self.dibujarLineaDeElementos(2,     [0,0,0,1,0,0,0,1,0,0,0,1,0,0,0])
        self.dibujarLineaDeElementos(1,     [0,0,0,0,0,3,0,0,2,2,2,0,0,0,0])
        self.dibujarLineaDeElementos(0,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        
	}
    method borrarSala(){
        self.borrarElementos()
    }
}
object sala_3 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_3.png"

    method cargarSala(){
        self.dibujarLineaDeElementos(14,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(13,    [0,0,3,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(12,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(11,    [0,0,0,0,0,0,2,2,2,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(10,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(9,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(8,     [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(7,     [0,0,0,4,0,0,0,1,0,0,0,0,4,0,0])
        self.dibujarLineaDeElementos(6,     [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(5,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(4,     [0,0,0,0,0,0,0,0,0,0,0,3,0,0,0])
        self.dibujarLineaDeElementos(3,     [0,0,0,0,0,0,2,2,2,0,0,0,0,0,0])  
        self.dibujarLineaDeElementos(2,     [0,3,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(1,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(0,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])


        // const mosca1 = new Mosca(id = 1)
        // mosca1.agregarEnemigo(enemigos)
        // const cv1 = new Cv(id = 2)
        // cv1.agregarEnemigo(enemigos)
        // const mosca2 = new Mosca(id = 3)
        // mosca2.agregarEnemigo(enemigos)
	}
    method borrarSala(){
        self.borrarElementos()
    }
}

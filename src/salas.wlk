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

    method dibujarLineaDeElementos(posicionY, vectorFila) {
		(0..vectorFila.size()-1).forEach({x=>  //no se porque tiene dos puntos confien nomas
			if(vectorFila.get(x) == 1 ){
				self.agregarParedEn(x, posicionY)
			}
		})
    }

    method agregarParedEn(x, y){
		const pared = new Pared(position = game.at(x,y))
		game.addVisual(pared)
	} 

}

class Pared{
	var property position
    method image() = "pared.png"
    method pegar(danioPlayer, bala){
        bala.destruir()
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
        game.removeVisual(self)
    }
}

class Pincho{
    var property position = posicionAleatoria.calcular()
    method image() = "pincho.png"

    method colisionarCon(personaje){
        personaje.asumirDanio(2)
    }
    method pegar(arg0, arg1){}
}

object sala_1 inherits Sala(){
    var property position = game.origin()

    method image() = "sala_1.png"

    const pincho1 = new Pincho(position = game.at(1,1))
    const pincho2 = new Pincho(position = game.at(1,13))
    const pincho3 = new Pincho(position = game.at(13,13))
    const pincho4 = new Pincho(position = game.at(13,1))

    method cargarSala(){
        self.dibujarLineaDeElementos(14,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(13,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(12,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(11,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(10,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(9,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(8,     [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(7,     [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(6,     [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0])
        self.dibujarLineaDeElementos(5,     [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(4,     [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(3,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])  
        self.dibujarLineaDeElementos(2,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(1,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(0,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])


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

// object sala_1 inherits Sala(){
//     var property position = game.origin()
//     method image() = "sala_1.png"
//     const pincho1 = new Pincho(position = game.at(1,1))
//     const pincho2 = new Pincho(position = game.at(1,13))
//     const pincho3 = new Pincho(position = game.at(13,13))
//     const pincho4 = new Pincho(position = game.at(13,1))

//     method cargarSala(){
        // const mosca1 = new Mosca(id = 1)
        // mosca1.agregarEnemigo(enemigos)
        // const cv1 = new Cv(id = 2)
        // cv1.agregarEnemigo(enemigos)
        // const mosca2 = new Mosca(id = 3)
        // mosca2.agregarEnemigo(enemigos)
        
//         game.addVisual(pincho1)
        
//         game.addVisual(pincho2)
        
//         game.addVisual(pincho3)
        
//         game.addVisual(pincho4)
//     }

//     method borrarSala(){
//         game.removeVisual(pincho1)
//         game.removeVisual(pincho2)
//         game.removeVisual(pincho3)
//         game.removeVisual(pincho4)
//     }

// }
object sala_2 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_2.png"

    const pincho1 = new Pincho(position = game.at(3,2))
    const pincho2 = new Pincho(position = game.at(2,12))
    const pincho3 = new Pincho(position = game.at(12,12))
    const pincho4 = new Pincho(position = game.at(10,4))

    method cargarSala(){
        self.dibujarLineaDeElementos(14,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(13,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(12,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(11,    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(10,    [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(9,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(8,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(7,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(6,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(5,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(4,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(3,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])  
        self.dibujarLineaDeElementos(2,     [0,0,0,1,0,0,0,1,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(1,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        self.dibujarLineaDeElementos(0,     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])


        const mosca1 = new Mosca(id = 4)
        mosca1.agregarEnemigo(enemigos)
        const cv1 = new Cv(id = 5)
        cv1.agregarEnemigo(enemigos)
        const mosca2 = new Mosca(id = 6)
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
object sala_3 inherits Sala(){
    var property position = game.origin()
    method image() = "sala_3.png"

    method cargarSala(){
        const mosca1 = new Mosca()
        mosca1.agregarEnemigo(enemigos)
    }
    method borrarSala(){
        
    }
}

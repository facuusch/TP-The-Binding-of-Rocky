import wollok.game.*
import personaje.*
import src.theBindingOfRocky.juego

object mainMenu{
    var property position = game.origin()
    var property spriteMenu = "main_menu_0.png"
    method image() = spriteMenu
    const personajes = [blito, gabi, tuca, manu, facu]
    var property personajeSeleccionado = 0

    

    method avanzarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        if(personajeSeleccionado >= (personajes.size())){
            personajeSeleccionado = 0
        }

        spriteMenu = "main_menu_" + personajeSeleccionado + ".png"

    }
    method retrocederPersonaje() {
        personajeSeleccionado = personajeSeleccionado - 1
        if(personajeSeleccionado < 0){
            personajeSeleccionado = (personajes.size() - 1)
        }

        spriteMenu = "main_menu_" + personajeSeleccionado + ".png"
    }

    method obtenerPersonajeActual() = personajes.get(personajeSeleccionado)
}

object gameOver{
    var property position = game.origin()
    method image() = "game_over.png"
}

object pantallaWin{
    var property position = game.origin()
    method image() = "pantalla_win.png"
}
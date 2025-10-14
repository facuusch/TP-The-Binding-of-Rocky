import wollok.game.*

object main_menu{
    var property position = game.origin()
    var property spriteMenu = "main_menu.png"
    method image() = spriteMenu
    var property personajeSeleccionado = 0

    method cambiarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        personajes.get(personajeSeleccionado)

        spriteMenu = "main_menu_2.png"
    }
}
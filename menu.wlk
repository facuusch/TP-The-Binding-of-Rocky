import wollok.game.*

object main_menu{
    var property position = game.origin()
    var property spriteMenu = "main_menu_0.png"
    method image() = spriteMenu
    var property personajes = []
    var property personajeSeleccionado = 0
    var property seleccionadoString = ""

    method setPersonajes(lista) {
        personajes = lista
    }

    method cambiarPersonaje() {
        personajeSeleccionado = personajeSeleccionado + 1
        if(personajeSeleccionado >= (personajes.size())){
            personajeSeleccionado = 0
            game.say(self, "volvi a personaje 0")
            
        }

        game.say(self, "aaa" + personajeSeleccionado.toString())
        personajes.get(personajeSeleccionado)

        seleccionadoString = personajeSeleccionado.toString()
        spriteMenu = "main_menu_" + personajeSeleccionado + ".png"

    }
}
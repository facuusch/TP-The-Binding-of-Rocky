import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    1.randomUpTo(game.width()+8).truncate(0),
    1.randomUpTo(game.height()+8).truncate(0)
  )
}

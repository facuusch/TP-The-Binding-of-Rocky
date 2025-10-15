import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    0.randomUpTo(game.width() - 1).truncate(0),
    0.randomUpTo(game.height() - 1).truncate(0)
  )
}

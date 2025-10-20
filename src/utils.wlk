import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    1.randomUpTo(game.width() - 1).truncate(0),
    1.randomUpTo(game.height() - 1).truncate(0)
  )
}


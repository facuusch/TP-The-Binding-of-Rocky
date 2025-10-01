import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    0.randomUpTo(game.width()).truncate(0),
    0.randomUpTo(game.height()).truncate(0)
  )
}
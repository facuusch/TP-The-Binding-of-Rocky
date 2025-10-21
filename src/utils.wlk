import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    1.randomUpTo(14).truncate(0),
    1.randomUpTo(14).truncate(0)
  )
}


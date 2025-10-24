import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    1.randomUpTo(14).truncate(0),
    1.randomUpTo(14).truncate(0)
  )
}

object outOfBounds {
  method verificar(position) = (
    (position.y() >= game.height())
     or (position.x() < 0)
      or (position.y() < 0)
       or (position.x() >= game.width()))
}

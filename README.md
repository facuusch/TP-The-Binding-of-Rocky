# 🎮 The Binding of Rocky

## 🧩 Descripción general

**The Binding of Rocky** es un juego desarrollado en **Wollok Game**, inspirado en *The Binding of Isaac*.  
El jugador puede elegir entre distintos personajes, cada uno con **estadísticas únicas** de vida y daño.  
El objetivo es **superar todas las salas (niveles)** eliminando a todos los enemigos mientras esquivas pinchos y proyectiles enemigos.

Cada sala presenta nuevos desafíos, enemigos con distintos patrones de movimiento, y objetos (items) que mejoran tus habilidades.

---

## 🕹️ Mecánicas principales

- **Moverse:**  
  Usa las teclas de dirección ⬆️⬇️⬅️➡️ para desplazarte por la sala.

- **Disparar proyectiles:**  
  Usa las teclas `W`, `A`, `S`, `D` para disparar en las cuatro direcciones.

- **Elegir personaje:**  
  En el menú principal, se puede navegar con las flechas `←` y `→` para elegir un personaje y presionar `Enter` para comenzar.

- **Avanzar de nivel:**  
  Al eliminar a todos los enemigos de la sala, el juego avanza automáticamente al siguiente nivel.

- **Reiniciar:**  
  Si el jugador muere, aparece una pantalla de *Game Over* y se puede reiniciar el juego presionando `Enter`.

---

## 👥 Personajes

Cada personaje tiene distintos valores de **vida** y **daño**, lo que afecta su estilo de juego.

| Personaje | Vida | Daño | Proyectil | Descripción breve |
|------------|------|------|------------|-------------------|
| 🪓 **Blito** | 7 | 3 | Cuchillo | Equilibrado, resistente. |
| 🔫 **Gabi** | 4 | 6 | Bala | Alto daño, baja vida. |
| 🧢 **Tuca** | 6 | 4 | Nose | Balanceado. |
| 🎵 **Manu** | 8 | 2 | Nota musical | Mucha vida, poco daño. |
| 🥦 **Facu** | 5 | 5 | Nose | Promedio en todo. |

---

## 👾 Enemigos

Cada enemigo hereda del **Enemigo base**, con comportamientos de movimiento distintos:

- **Mosca:** se mueve verticalmente rebotando.  
- **Cv:** se desplaza en forma cuadrada.  
- **Mostro:** se mueve en una trayectoria en “V”.  
- **NuevoMonstruoB:** se mueve en una “V” invertida.  

Cada enemigo puede causar daño al jugador y debe ser derrotado para pasar de sala.

---

## 🍔 Ítems

Durante el juego, el jugador puede encontrar ítems que otorgan mejoras:

- **Hamburguesa / Oktubre:** aumentan la vida (hasta un máximo de 10).  
- **Brócoli:** aumenta el daño (hasta un máximo de 8).  
- **Arma:** cambia el sprite del personaje al alternativo.

Cada ítem reproduce un sonido característico al ser recogido.

---

## 🧠 Conceptos del paradigma (POO) aplicados

Este proyecto hace un uso intensivo de los **principios de Programación Orientada a Objetos**, presentes en Wollok:

### 🔹 **Clases y Objetos**
- Se definen **clases** como `Personaje`, `Enemigo`, `Item`, `Proyectil` que sirven como moldes.  
- Se crean **objetos concretos** (por ejemplo `blito`, `gabi`, `hamburguesa`, `brocoli`) que son instancias de esas clases o heredan de ellas.

📌 Ejemplo:
```wollok
object blito inherits Personaje(vida = 7, danio = 3)

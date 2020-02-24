# Planetary system

Random planetary system visualizer using [Processing](https://processing.org).
> **Adrián Lorenzo Melián** - *Creando Interfaces de Usuario*, [**ULPGC**](https://www.ulpgc.es).
> adrian.lorenzo101@alu.ulpgc.es

<div align="center">
 <img src=images/demo.gif alt="Creator demo"></img>
 <p>Figura 1 - Demostración de la ejecución de la aplicación</p>
</div>

***

## Índice
* [Introducción](#introduction)
* [Instrucciones de uso](#instructions) 
* [Implementación](#implementation)
    * [Arquitectura](#architecture)
    * [Generación aleatoria de cuerpos celestes](#celestial-body-generation)
* [Herramientas y recursos utilizados](#tools-and-resources)
* [Referencias](#references)

## Introducción <a id="introduction"></a>
El objetivo de esta práctica es **la creación de un prototipo que muestre un sistema planetario** [1] que se encuentre en movimiento y posea al menos cinco planetas y alguna luna usando alguna imagen.

Para cumplir este objetivo, se ha querido ir un paso más allá y se ha elegido desarrollar un prototipo **que genera en cada ejecución un sistema planetario pseudo-aleatorio que cumpla con las requisitos.**

## Implementación <a id="implementation"></a>

### Arquitectura <a id="architecture"></a>

Para poder trabajar bajo el paradigma de la **programación orientada a objetos**, fue necesario analizar el comportamiento de cada uno de los componentes que vamos utilizar. 

Era claro que **todos los elementos que aparecen en la pantalla compartían el mismo comportamiento**: todos eran **dibujables** en la pantalla. Por tanto, era necesario abstraer ese comportamiento en una interfaz, la cuál finalmente fue denominada `Drawable`.

```java
public interface Drawable {
    public void draw();
}
```

Como en este caso también **existen comportamientos propios de movimiento de los cuerpos celestes**, también se han abstraido esos comportamientos en dos interfaces: `Rotatable`, debido a que los cuerpos celestes que presentaremos rotan en su eje, y `Translatable`, ya que algunos de ellos se trasladan, en este caso, siguiendo una óribta.

```java
public interface Translatable {
  public void translate(Vector origin); 
}

public interface Rotatable {
  public void rotate(); 
}
```

Todos las clases de los elementos que aparecen en la pantalla **implementan la interfaz `Drawable`**. Las clases de estos componentes son:

- `CelestialBody`. Clase que representa un cuerpo celeste, que en este caso es un cuerpo esférico que es posible o no transladarse.
- `Star`. Clase que representa a una estrella. Una estrella es un cuerpo celeste que puede tener varios planetas girando alrededor de sí mismo, y también puede rotar en si mismo.
- `Planet`. Clase que representa un planeta. Un planeta es un cuerpo celeste que puede tener varios satélites girando alrededor de sí mismo, y también puede rotar en si mismo.
- `Satellite`. Clase que representa a un satélite. Un satélite es un cuerpo celeste que puede rotar en sí mismo.

Para el control del juego, se ha implementado la clase `PlanetarySystemController`. Esta **se encarga de controlar el bucle que compone el programa**.

Además, se han creado una serie de clases auxiliares que nos permiten manejar de forma los componentes y el controlador de la aplicación, como:

- `Vector`. Que representa un vector en un espacio de 3 dimensiones.
- `Colors`. Clase que contiene recursos de color para dibujar las formas tridimensionales.

### Generación aleatoria de cuerpos celestes <a id="celestial-body-generation"></a>

Para generar el sistema planetario, se ha elegido seguir **un patrón pseudo-aleatorio en el que, a partir de una estrella, se genere un conjunto N de planetas realizando una órbita circular en la misma.** A su vez, **estos planetas podrán tener K satélites diferentes realizando una órbita cirular en sí mismo.**

Para evitar que exista superposición ente figuras (y por tanto, una colisión en un escenario real), se ha decidido dejar un espacio considerable entre los cuerpos celestes. Por otra parte, también se escoge de entre la paleta de colores creadas para los cuerpos celestes correspondientes, una opción pseudoaleatoria.

```java
Point currentPoint = points.get(i+1).getTranslatedPoint(origin);

for (float rad = 0; rad < 2*PI; rad += PI/64) {
  solid.vertex(
    currentPoint.getX() * cos(rad) - zValue * sin(rad), 
    currentPoint.getY(), 
    currentPoint.getX() * sin(rad) + zValue * cos(rad)
  );
}
```

## Herramientas y recursos utilizados <a id="tools-and-resources"></a>
- [Giphy](https://giphy.com) - Herramienta usada para la creación de gifs a partir de los frames de la aplicación.
- [Material Design Color Tool](https://material.io/resources/color/) - Herramienta usada para obtener la paleta de color usada para los cuerpos celestes (planetas, satélites y estrellas).
- [Solar System Scope Textures](https://www.solarsystemscope.com/textures/) - Recurso de texturas del espacio desde la que se obtuvo la imagen del espacio usada para el fondo.


## Referencias <a id="references"></a>
- [1] [Sistema planetario](https://es.wikipedia.org/wiki/Sistema_planetario)




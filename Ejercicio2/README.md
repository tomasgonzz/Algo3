# Preguntas

## Abstracción de los tests 01 y 02 

> En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Lo que hicimos para sacar el codigo repetido fue hacer una abstraccion. Basicamente ambos test median la diferencia entre el tiempo antes de ejecutar y luego de ejecutar. Entonces haciendo una abstraccion se podian hacer los dos test en un mismo mensaje.  

## Cómo representar en Smalltalk

> ¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

En principal manera en la que podemos representar entidades de la realidad en Smalltalk es atraves de objetos, estos estarán definidos por los mensajes que sepan responder y la manera en la que lo hagan (método). Cada objeto a su vez podrá tener en su "interior" colaboradores, que si bien forman parte de nuestro entorno, no se corresponde con la entidad principal que intentamos representar.

## Teoría de Naur

> ¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Existe una relación muy cercana entre la Visión de Construcción de Teoría propuesta por Peter Naur y el accionar de quitar código repetido, ya que en este proceso, nosotros, como programadores, lo que estamos realizando es la construcción de una abstracción (teorica), para representar de mejor manera la realidad. Este transformacion involucra tener el conocimiento necesario de la teoría como para poder realizar las modificaciones.

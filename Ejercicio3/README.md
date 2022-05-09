## Preguntas teóricas

### Aporte de los mensajes de DD

>En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En un double dispatch, el primer llamado lo que hace es repartir la responsabilidad a las subclases mientras que el segundo llamado se encarga de verificar que el objeto con clase ya conocida sepa responder lo que se necesita.

### Lógica de instanciado

>Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La logica de crear una instancia es en el apartado de clases, por ejemplo en este ejercicio cuando se crean las instancias en el setup se utiliza el mensaje with: que se encuentra en la clase Entero. Entonces la responsabilidad de crear nuevas instancias de la clase Entero se encuentra justamente en la clase de Entero. 

### Nombres de las categorías de métodos

>Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Para categorizar tomamos como criterio lo que hace el metodo y con quien colabora. Por ejemplo: todos los metodos que interactuan dos Enteros los categorizamos con "operations with another Entero" entonces el nombre de la categoria ya nos esta diciendo lo que van a hacer los metodos que se encuentren dentro. 

### Subclass Responsibility

>Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Todos los numeros tienen que saber responder los mismos mensajes pero segun el tipo de numero va a tener distinta forma de hacerlo. Entonces el "que" va a ser el mismo pero no el "como". Al poner en la superclase ese mensaje, la superclase esta dejando la responsabilidad de los mensajes en las subclases para que cada tipo de numero se ocupe del "como".

### No rompas

>¿Por qué está mal/qué problemas trae romper encapsulamiento?

El encapsulamiento tiene como objetivo una mejor organizacion de nuestro modelo para representar la realidad. Por lo que romperlo implicaria, por un lado, fallar en la reproduccion de los objetos que queremos modelar y por otro lado estariamos dejando que dentro de nuestro modelo se creen conexiones que no suceden en la realidad. 


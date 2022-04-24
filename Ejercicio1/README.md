# Preguntas

## Sobre implementar funcionalidad

> Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?

Dentro de las sugerencias dadas por el curso se nos recomendaba el desarrollo del codigo para que pase cada prueba respetando el orden estipulado. Considerando eso, al momento de desarrollarlo, fuimos resolviendo cada test individualmente y sin hacer futurologia.
De modo que no nos pasaron los tres de una, sino que lo implementamos de a partes. Creemos que al hacerlo de esta forma te permite centrarte en un objetivo en especifico, que para este caso, nos permitio desarrollar el codigo de mejor manera. Sin embargo es cierto que al hacer paso por paso sin ver los test siguientes tuvimos que volver al codigo ya hecho y modificarlo.

## Sobre código repetido

> ¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

La verdad que si hay codigo repetido, es lo minimo y necesario. Si intentaramos deshacernos del codigo repetido estariamos complicando mas las cosas. El habitat es el responsable de saber cuantas polillas y orugas hay disponibles para que las avispas pongan huevos. 
En nuestra opinion no tendria sentido que el insecto sepa cuantas orugas o polillas hay disponibles, la cantidad de orugas o de polillas esta dentro del habitat y no forma parte de ninguna de las avispas. Nos quedamos con que el habitat deberia de controlar esos recursos.

## Sobre código repetido 2

> Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación ¿cómo resolvieron guardar los huevos? ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?

Dados los paradigmas vistos el jueves podriamos pensar en un objeto generico llamado avispa del cual Oriana, Ornella, Polly y Lara sean hijas y programar las funciones especificadas de cada una como "metodos internos". Hicimos algo similar en nuestra implementacion ya que Oriana tiene caracteristicas muy similares a Ornella, los implementamos como padre e hijo. 
Para guardar los huevos utilizamos colaboradores internos en cada avispa, nos parecio mucho mas sencillo que usar diccionarios ya que si bien tener diccionarios nos permitia tener toda la informacion junta, al ser solo 3 tipos de huevos distintos estariamos agregando una complejidad innecesaria. Ademas al quedar el colaborador interno dentro de cada avispa, podemos acceder a la informacion sin necesidad del habitat. 

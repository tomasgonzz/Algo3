# Extra

>Se pide extender el modelo para que además de representar al stack ilimitado ya construido, se puedan construir instancias de un stack limitado. Es decir, uno de que tenga una cantidad limitada de celdas y que no se puedan pushear más elementos que los disponibles en su capacidad. **Se pide además analizar cuál de los modelos anteriores cree que es más sencillo extender para representarla y hacerlo.** Además se deberán agregar los casos de tests que hagan falta para probar el nuevo tipo de stack.

Nuestra implementacion considera que un stack ilimitado tiene como "limite" el infinito. De esta manera podemos modelar ambos en unos solo. Tenemos un stack el cual se inicializa con un limite infinito por defecto a menos que el usuario quiera ponerle un limite. Es mas sencillo porque operan igual, excepto el push el cual debe verificar que se este dentro del limite para poder ingresar mas elementos en el stack. 

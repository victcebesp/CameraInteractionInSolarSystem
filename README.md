# Sistema planetario
Víctor Ceballos Espinosa

## Introducción
En esta ocasión, el objetivo principal de la práctica consiste en hacer uso de los métodos relacionados con las transformaciones disponibles en Processing. Entre esas transformaciones podemos encontrar escalado, rotaciones o traslaciones. Inicialmente realizamos pruebas con objetos en dos dimensiones y posteriormente pasamos a las tres dimensiones.

Esta práctica consiste en implementar un sistema planetario en el que se sitúen una estrella, cinco planetas y por lo menos una luna. En mi caso he querido imitar el sistema solar, por lo que he implementado un Sol, alrededor cinco planetas entre los cuales se encuentra la Tierra con sus respectiva Luna.


## Representación
Para la representación de los planetas, estrella y luna, decidí crear una clase llamada CelestialBody. Al ser dicha clase la responsable de representar a los diferentes cuerpos celestiales, los objetos de dicha clase reciben por constructor argumentos típicos de la definición de un cuerpo celestial como son el radio o la velocidad en órbita.


Como se puede ver cuando se ejecuta el programa, los diferentes cuerpos celestiales tienen diferentes texturas. Esto se consigue pasándoles por el constructor una PImage que se le aplica luego con el método de PShape setTexture(). 

Por último, cada cuerpo celestial tiene un nombre que es mostrado justo encima del mismo. Esto se consigue pasando por el constructor el nombre de dicho cuerpo celestial y haciendo uso del método text.

## Rotación
Sin duda alguna, uno de los aspectos más interesantes de la práctica, tiene que ver con una transformación. Para ser más específico, me refiero a la transformación de rotación. Cuando se crea un cuerpo celestial, aleatoriamente se le asigna un vector en tres dimensiones que es escalado luego con el argumento distancia que recibe por el constructor. Si rotamos el cuerpo celestial sobre ese vector, giraría sobre sí mismo. Es por esto que necesitamos un vector que nos permite hacer rotar correctamente el planeta sobre la estrella o la luna sobre el planeta. Para conseguir esto, a partir del vector interno y un vector perpendicular a este, obtengo un vector perpendicular al plano que forman haciendo un producto vectorial entre ambos.

Ya con el vector correcto sobre el que hay que rotar, y haciendo uso del método rotate en la versión en la que se le puede pasar un ángulo y las tres componentes de un vector, se consigue hacer rotar el cuerpo celestial correctamente.

Todo esto se encuentra encerrado entre los métodos pushMatrix y popMatrix para que las transformaciones no afecten a cuerpos celestiales no relacionados. En el caso de la Tierra y la Luna si debería afectar porque están relacionados (la Luna rota alrededor de la Tierra).

Por supuesto, en cada llamada del método draw se aumenta el ángulo que se le pasa al método rotate para que efectivamente los cuerpos celestiales roten.

Lo explicado acerca de la rotación se encuentra en el método show de la clase CelestialBody.


## Objeto controlado por teclado
Para implementar el requerimiento de poder controlar por teclado un objeto, he decidido cargar el modelo de un destructor de Star Wars. Las instrucciones para su control se encuentran explicadas en la aplicación y las podrá ver cuando la ejecute. Sin embargo para mayor aclaración, las añado aquí también:

- Para mover el destructor hacia delante, se hará uso de la tecla “w”.
- Para mover el destructor hacia detrás, se hará uso de la tecla “s”.
- Para mover el destructor hacia la derecha, se hará uso de la tecla “d”.
- Para mover el destructor hacia la izquierda, se hará uso de la tecla “a”.
- Para mover el destructor hacia arriba, se hará uso de la tecla “ESPACIO”.
- Para mover el destructor hacia debajo, se hará uso de la tecla “x”.

## Cámara
He decidido añadir una herramienta que permita mover la cámara usando el ratón, de tal manera que el usuario pueda observar el sistema planetario desde diferentes puntos de vista. Para mover la cámara, se tendrá que hacer un click con el ratón y arrastrar. La herramienta también permite hacer zoom haciendo uso de la rueda del ratón.

## Referencias
Para las diferentes texturas
http://planetpixelemporium.com

Enunciado de la práctica
https://cv-aep.ulpgc.es/cv/ulpgctp19/pluginfile.php/182523/mod_resource/content/10/CIU_Pr_cticas.pdf

Repositorio de Github
https://github.com/victcebesp/Planetarium

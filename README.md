# Interacción con la cámara en el sistema planetario
Víctor Ceballos Espinosa

## Introducción
Esta práctica tiene por objetivo ampliar la práctica anterior aportando la posibilidad de cambiar entre dos cámaras diferentes. Por un lado se encontrará la cámara global mediante la cual tendremos una visión global del sistema planetario. Por otro lado encontramos una cámara desde el punto de vista de la nave que se implementó en la anterior práctica. Esta segunda cámara, en vez de tener una visión global del sistema planetario, nos permitirá movernos entre los planetas siguiendo la movilidad que se describió en la anterior práctica y que será nombrada de nuevo en este informe para mayor claridad y comodidad.

## Cámara
Tal y como se indicó en la introducción, en esta implementación existen dos cámaras, una cámara global y una desde el punto de vista de la nave. En la práctica anterior ya había implementado una cámara global. Sin embargo, en vez de usar la función camera de Processing, usé una herramienta llamada PeasyCam a raíz de un vídeo que ví en el canal de youtube The Coding Challenge.

Para una implementación más cómoda, tomé la decisión de dejar de usar esa herramienta y pasar a usar la función camera de Processing.

En esta cámara global, lo único que tuve que hacer fue cambiar los parámetros que vienen por defecto, desplazando la cámara al punto (0, 0, (height/2.0) / tan(PI*30.0 / 180.0). Adicionalmente, dinámicamente cambio el punto al que mira la cámara haciendo uso de mouseX y mouseY. Para conseguir que la cámara apunte al centro de la pantalla cuando el ratón esté situado en el centro de la misma, a mouseX le resto la mitad del ancho de la pantalla y a mouseY le resto la mitad de la altura de la pantalla.

Con esto se consigue que el usuario moviendo el ratón por la pantalla, de forma intuitiva pueda mover el punto al que la cámara está mirando.

Como se indicó anteriormente, existen dos tipos de cámaras. Para alterar entre ellas, se tiene que pulsar la tecla “c”. Cuando dicha tecla se pulsa, se cambia el valor de la variable generalViewMode, de tal manera que en vez de mostrar la cámara global en el método showCamera, se muestre la cámara desde el punto de vista de la imagen.

Una vez se está en la cámara de la nave, se podrá seguir haciendo uso de los controles mediante los cuales se mueve la nave explicados en la práctica anterior. Dichos controles son:

 - Para mover la nave hacia delante, se hará uso de la tecla “w”.
 - Para mover la nave hacia detrás, se hará uso de la tecla “s”.
 - Para mover la nave hacia la derecha, se hará uso de la tecla “d”.
 - Para mover la nave hacia la izquierda, se hará uso de la tecla “a”.
 - Para mover la nave hacia arriba, se hará uso de la tecla “ESPACIO”.
 - Para mover la nave hacia debajo, se hará uso de la tecla “x”.

Adicionalmente, se podrá interactuar con la cámara de la misma forma que con la cámara global. Moviendo el ratón, se podrá cambiar el punto al que mira dicha cámara. En está ocasión aparece una complicación, cuando la nave está situada detrás del sol, el sentido del eje x es el opuesto. Para mantener el control de la cámara, se controla si la nave está delante o detrás del sol, modificando el parámetro de la función camera.

Adicionalmente, en esta segunda cámara, se permite hacer un movimiento conocido en el mundo de la aviación como un rodamiento (roll). Para hacer este movimiento, bastará con usar las teclas de flecha izquierda y derecha.

Todas las indicaciones sobre el control se pueden encontrar en las instrucciones escritas al ejecutar la aplicación.

## Referencias

[Repositorio de GitHub](https://github.com/victcebesp/CameraInteractionInSolarSystem)

[Video de Youtube en el que se usa PeasyCam](https://www.youtube.com/watch?v=FGAwi7wpU8c)

[Enunciado de la práctica](https://cv-aep.ulpgc.es/cv/ulpgctp19/pluginfile.php/182523/mod_resource/content/12/CIU_Pr_cticas.pdf)

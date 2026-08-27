# ADR 1: Uso del Patrón Event Bus para Navegación de Escenas
## Estado
Aceptado

## Contexto
En el Laboratorio 1, la navegación se realizaba mediante llamadas directas a `change_scene_to_file` con rutas absolutas de texto, lo que generaba un alto acoplamiento y dependencias rígidas entre los componentes visuales de la interfaz de usuario. Cualquier reorganización de directorios rompía el proyecto en cascada.

## Decisión
Implementaremos el patrón de diseño Observer de forma combinada con un Singleton Autoload denominado `EventBus`. Un script orquestador centralizado (`MainApp`) gestionará las instancias de escenas basándose en las señales reactivas emitidas de manera indirecta por los botones de interfaces, eliminando referencias cruzadas rígidas.

## Consecuencias
* **Positivas:** Bajo acoplamiento lógico, facilidad para reorganizar o cambiar el árbol de directorios del FileSystem sin romper el código, y mayor facilidad para testear paneles visuales de forma aislada.
* **Negativas:** Introduce una pequeña capa de abstracción indirecta en el flujo de ejecución de la aplicación.

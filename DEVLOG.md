## [Sprint 1] - Laboratorio 2: Escenas, Nodos y Eventos
* **Fecha:** 19/08/2026
* **Funcionalidades:** Implementación exitosa de un sistema de navegación desacoplado entre 4 entornos modulares (Menú, Simulación Base, Configuración y Créditos) utilizando un cargador dinámico centralizado (`MainApp`) y escenas Control de UI altamente cohesivas.
* **Dificultades:** Comprensión de las ventajas del tipado estático (`-> void`) y la resolución del ámbito de carga de variables dinámicas al inicializar la escena principal cuando la referencia previa es nula.
* **Decisiones:** Se implementó el patrón Event Bus para eliminar llamadas directas cruzadas como `get_node()`, erradicando el antipatrón de dependencias rígidas. Se documentó la decisión mediante el estándar ADR-1.

# Bitácora de Desarrollo (DEVLOG) - Sistema Interactivo

 ## [2026-09-11] - Laboratorio 4: Gestión de Estado Global y Componentes de Navegación Reutilizables

 ### Actividades Realizadas

 * Inicialización de la rama de trabajo `lab-4` para aislar el desarrollo técnico.
 * Implementación de `GlobalManager` mediante un Autoload para administrar
   el estado global de la simulación.
 * Integración del estado de precios y cantidades mediante señales del Event Bus.
 * Actualización reactiva del precio total mostrado en `Step1Base`.
 * Creación del componente reutilizable `ButtonNav` utilizando `export target_scene`.
 * Refactorización de los botones de navegación y adaptación de `MainApp`.
 * Incorporación de la propiedad `show_previous` como punto de extensión.

 ### Desafíos y Soluciones

 * *Desafío:* Separar la administración del estado de la interfaz gráfica.
 * *Solución:* Se centralizó el estado de la simulación en `GlobalManager` y
   se utilizó el Event Bus para comunicar los cambios.

 * *Desafío:* Diseñar un componente de navegación que pueda reutilizarse y evolucionar.
 * *Solución:* Se creó `ButtonNav` como una escena reutilizable, permitiendo
   configurar su destino y agregar comportamientos desde un único componente.

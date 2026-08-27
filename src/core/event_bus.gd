# res://src/core/event_bus.gd
extends Node

# Señal global para solicitar el cambio de entornos interactivos
@warning_ignore("unused_signal")
signal navigation_requested(target_scene_path: String)

# Señal global para notificar la modificación de parámetros lógicos
@warning_ignore("unused_signal")
signal parameter_changed(param_name: String, value: Variant)

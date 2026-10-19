extends Button

@export_file("*.tscn") var target_scene: String
@export var discard_previous: bool = false

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	EventBus.navigation_requested.emit(target_scene, discard_previous)


func _on_button_nav_pressed() -> void:
	pass # Replace with function body.

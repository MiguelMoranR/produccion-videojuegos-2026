# res://src/scenes/config/config_panel.gd
extends Node

@onready var btn_back: Button = $BtnBack

func _ready() -> void:
	btn_back.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/menu/menu_panel.tscn")
	)

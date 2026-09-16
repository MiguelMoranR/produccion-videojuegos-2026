# res://src/scenes/menu/menu_panel.gd
extends Control

@onready var btn_buypanel: Button = $VBoxMenu/BtnBuyPanel
@onready var btn_config: Button = $VBoxMenu/BtnConfig
@onready var btn_credits: Button = $VBoxMenu/BtnCredits
@onready var btn_exit: Button = $VBoxMenu/BtnSalir

func _ready() -> void:
	# Conectar botones mediante funciones anónimas (lambdas) inline de emisión global
	btn_buypanel.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/simulation/buy_panel.tscn")
	)
	btn_config.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/config/config_panel.tscn")
	)
	btn_credits.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/credits/credits_panel.tscn")
	)
	btn_exit.pressed.connect(func() -> void:
		get_tree().quit()
	)

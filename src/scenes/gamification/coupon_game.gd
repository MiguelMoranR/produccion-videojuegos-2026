extends Node2D
@export var target_items: int = 10
@export var max_spawned_items: int = 15
var current_spawned_items: int = 0
var collected_items: int = 0

func _ready() -> void:
	var spawners : Array = get_tree().get_nodes_in_group("spawner")
	for spawn in spawners:
		spawn.spawned_item.connect(_on_item_spawned)

func _on_item_spawned() -> void:
	current_spawned_items += 1
	if current_spawned_items > max_spawned_items:
		lose_game()

func _on_player_collected_food() -> void:
	collected_items += 1
	if collected_items >= target_items:
		win_game()

func win_game() -> void:
	pass

func lose_game() -> void:
	pass

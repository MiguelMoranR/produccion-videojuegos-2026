# res://src/scenes/simulation/step_1_base.gd
extends Control

@onready var btn_ingrediente_1: Button = $VBoxContainer/GridContainer/BtnIngrediente1
@onready var btn_ingrediente_2: Button = $VBoxContainer/GridContainer/BtnIngrediente2
@onready var btn_item1: Button = $VBoxContainer/GridContainer/BtnItem1
@onready var btn_item2: Button = $VBoxContainer/GridContainer/BtnItem2
@onready var lbl_status_local: Label = $LblStatusLocal
@onready var btn_volver: Button = $VBoxContainer/BtnVolver

# --- VARIABLES DE ESTADO PARA LAS PRUEBAS ---
var costo_base_actual: int = 5000  # Prueba 1: Base inicial empieza en $5000
var nombre_base_actual: String = "base_1"

# Contadores de items seleccionados
var cantidad_item1: int = 0
var cantidad_item2: int = 0

# Precios individuales de los items
const PRECIO_ITEM1: int = 1000
const PRECIO_ITEM2: int = 1500

func _ready() -> void:
	# Limpieza de conexiones e inicialización limpia con lambdas puras
	btn_ingrediente_1.pressed.connect(func(): _on_base_pressed("ingrediente_1"))
	btn_ingrediente_2.pressed.connect(func(): _on_base_pressed("ingrediente_2"))
	
	btn_item1.pressed.connect(func(): 
		cantidad_item1 += 1
		_actualizar_interfaz()
	)
	
	btn_item2.pressed.connect(func(): 
		cantidad_item2 += 1
		_actualizar_interfaz()
	)
	
	btn_volver.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/menu/menu_panel.tscn")
	)

	_actualizar_interfaz()

# Función centralizada para calcular el total y refrescar el texto en pantalla
func _actualizar_interfaz() -> void:
	# 1. Forzar almacenamiento limpio en variables locales
	var base_cost: int = costo_base_actual
	var i1_cost: int = cantidad_item1 * PRECIO_ITEM1
	var i2_cost: int = cantidad_item2 * PRECIO_ITEM2
	
	# 2. Calcular el total de forma segura
	var total: int = base_cost + i1_cost + i2_cost
	
	# 3. Super Diagnóstico en Consola (¡Esto nos dirá la verdad!)
	print("--- DESGLOSE DEL CÁLCULO ---")
	print("Base actual: ", nombre_base_actual, " ($", base_cost, ")")
	print("Items 1: ", cantidad_item1, " (Suma: $", i1_cost, ")")
	print("Items 2: ", cantidad_item2, " (Suma: $", i2_cost, ")")
	
	print("TOTAL CALCULADO: $", total)
	print("----------------------------")
	
	print("Actualizado -> ", nombre_base_actual, " | Total: $", total)
	
	# 4. Asignación directa e indestructible al Label
	if lbl_status_local:
		lbl_status_local.text = "Selección local: " + str(nombre_base_actual) + " (Total: $" + str(total) + ")"
	else:
		print("¡ERROR CRÍTICO: lbl_status_local es nulo o no se encuentra!")	
	
# Al presionar un botón de Base (Ingrediente)
func _on_base_pressed(tipo_base: String) -> void:
	if tipo_base == "ingrediente_1":
		nombre_base_actual = "base_1"
		costo_base_actual = 5000
	elif tipo_base == "ingrediente_2":
		nombre_base_actual = "base_2"
		costo_base_actual = 7000
		
	_actualizar_interfaz()

func _on_item_pressed(tipo_item: String) -> void:
	print("--- INICIO CLICK ---")
	print("Antes - Item1: ", cantidad_item1, " | Item2: ", cantidad_item2)

	if tipo_item == "item_1":
		cantidad_item1 += 1
	elif tipo_item == "item_2":
		cantidad_item2 += 1
	
	print("Después - Item1: ", cantidad_item1, " | Item2: ", cantidad_item2)

	_actualizar_interfaz()

func _on_btn_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/menu/menu_panel.tscn")
	

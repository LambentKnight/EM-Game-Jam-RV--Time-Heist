extends Node2D

@onready var time: Label = $CanvasLayer/Label
@onready var timer: Timer = $Timer
@onready var inventory = $CanvasLayer/InventroyGUI
@onready var score = $CanvasLayer/Label
@onready var music = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	$Timer.paused = true
	music.play()


func _on_inventroy_gui_closed() -> void:
	get_tree().paused = false
	$Timer.paused = false


func _on_inventroy_gui_opened() -> void:
	get_tree().paused = true
	$Timer.paused = true
	time.text = str("Time Remaining: ") + str(timer.wait_time) + str("s")


func _on_timer_timeout() -> void:
	print("Timer Stop")
	inventory.open()
	score.open()
	#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

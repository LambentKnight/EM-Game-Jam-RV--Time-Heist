extends Node2D
@onready var music = $title

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/main.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

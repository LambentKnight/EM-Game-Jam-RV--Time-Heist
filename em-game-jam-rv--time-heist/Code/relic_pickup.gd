extends Area2D

var TIME: int = 60
@onready var grabbed_sound: AudioStreamPlayer2D = $GrabbedSound
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		print("Grabbed")
		print(TIME)
		
		collision_shape_2d.set_deferred("disabled", true)
		
		grabbed_sound.play()
		await grabbed_sound.finished
		
		queue_free()

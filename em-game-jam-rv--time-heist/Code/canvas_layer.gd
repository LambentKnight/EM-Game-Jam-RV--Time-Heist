extends CanvasLayer

@onready var inventory =$InventroyGUI
@onready var timer = $Label

func _ready() -> void:
	inventory.close()
	timer.close()

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
				inventory.close()
				timer.close()
		else:
			inventory.open()
			timer.open()

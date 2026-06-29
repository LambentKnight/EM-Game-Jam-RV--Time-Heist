extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("Out Of Time")
	timer.wait_time = 3
	timer.start()
	super.collect(inventory)

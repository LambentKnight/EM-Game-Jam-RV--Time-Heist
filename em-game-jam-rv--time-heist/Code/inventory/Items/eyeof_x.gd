extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("Eye Of X")
	timer.wait_time = 20
	timer.start()
	super.collect(inventory)

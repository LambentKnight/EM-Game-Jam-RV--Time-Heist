extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("Hourglass")
	timer.wait_time = 13
	timer.start()
	super.collect(inventory)

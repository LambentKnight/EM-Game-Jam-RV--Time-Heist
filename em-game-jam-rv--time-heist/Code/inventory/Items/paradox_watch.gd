extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("Paradox Watch")
	timer.wait_time = 8
	timer.start()
	super.collect(inventory)

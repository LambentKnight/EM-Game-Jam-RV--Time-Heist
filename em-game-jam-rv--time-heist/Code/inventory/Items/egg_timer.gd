extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("EggTimer")
	timer.wait_time = 5
	timer.start()
	super.collect(inventory)

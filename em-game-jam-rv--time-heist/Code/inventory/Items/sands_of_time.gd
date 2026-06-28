extends "res://Code/inventory/Items/relic_pickup.gd"
@onready var timer: Timer = $"../../Timer"

func collect(inventory):
	print("SandsOfTIme")
	timer.wait_time = 11
	timer.start()
	super.collect(inventory)

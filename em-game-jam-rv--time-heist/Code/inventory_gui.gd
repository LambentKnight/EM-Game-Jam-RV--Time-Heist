extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: Inventory = preload("res://Code/inventory/playerInventory.tres")
@onready var ItemTimeGuiClass = preload("res://Scenes/itemsTimeGui.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	connectSlots()
	inventory.updated.connect(update)
	update()

func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		var inventorySlot: InventorySlot = inventory.slots[i]
		
		if !inventorySlot.item: continue
		
		var itemTimeGui: ItemTimeGui = slots[i].itemTimeGui
		if !itemTimeGui:
			itemTimeGui = ItemTimeGuiClass.instantiate()
			slots[i].insert(itemTimeGui)
		
		itemTimeGui.inventorySlot = inventorySlot
		itemTimeGui.update()
		print("test")
			

func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()

func onSlotClicked(_slot):
	pass

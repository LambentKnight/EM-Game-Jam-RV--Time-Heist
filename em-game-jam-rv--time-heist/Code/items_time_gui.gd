extends Panel

class_name ItemTimeGui

@onready var itemSprite: Sprite2D = $item
@onready var timeLabel: Label = $Label

var inventorySlot: InventorySlot

func update():
	if !inventorySlot || inventorySlot.item: return
	
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture
	if inventorySlot.time > 1:
		timeLabel.visible = true
		timeLabel.text = str(inventorySlot.time)
		print(inventorySlot.time)
	else:
		timeLabel.visible = false
		print("eh")
	

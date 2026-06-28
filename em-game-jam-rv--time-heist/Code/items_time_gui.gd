extends Panel

class_name ItemTimeGui

@onready var itemSprite: Sprite2D = $item
@onready var timeLabel: Label = $Label

var inventorySlot: InventorySlot
#var timer: InventoryItem

func update():
	if !inventorySlot || !inventorySlot.item: return
	
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture

	if inventorySlot.time > 1:
		timeLabel.visible = true
		timeLabel.text = str(inventorySlot.time)
		print(inventorySlot.time)
		#timeLabel.text = str(timer.timeLeft)
	else:
		timeLabel.visible = true
		print("eh")

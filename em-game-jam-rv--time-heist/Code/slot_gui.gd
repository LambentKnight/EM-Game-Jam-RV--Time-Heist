extends Button

@onready var backgroundSprite: Sprite2D = $background
@onready var container: CenterContainer = $CenterContainer

var itemTimeGui: ItemTimeGui

func insert(itg: ItemTimeGui):
	itemTimeGui = itg
	backgroundSprite.frame = 1
	container.add_child(itemTimeGui)

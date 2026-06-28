extends Label

signal opened
signal closed

	
func open():
	visible = true
	opened.emit()
	
func close():
	visible = false
	closed.emit()

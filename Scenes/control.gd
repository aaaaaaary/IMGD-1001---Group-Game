extends Control

@onready var credits = $Label

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			credits.position.y += 20

		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			credits.position.y -= 20

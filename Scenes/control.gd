extends Control

@onready var title = $credits
@onready var credits = $CREDIT


func _process(delta):
	if credits.position.y > -700:
		title.position.y -= 40 * delta
		credits.position.y -= 40 * delta

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/splashscreen.tscn")

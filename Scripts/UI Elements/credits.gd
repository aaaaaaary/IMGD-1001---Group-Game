extends Control

@onready var title = $credits
@onready var credits = $CREDIT


func _process(delta):
	if credits.position.y > -2500:
		title.position.y -= 200 * delta
		credits.position.y -= 200 * delta
	elif credits.position.y <= -2500:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/UI Elements/main_menu.tscn")

 
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI Elements/main_menu.tscn")

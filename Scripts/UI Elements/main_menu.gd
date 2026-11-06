extends Control

@onready var click_sound = $click

func _on_start_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_credits_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

func _on_version_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://Scenes/Version_Notes_Hub.tscn")

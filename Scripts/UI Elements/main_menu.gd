extends Control

@onready var click_sound = $click
@onready var Reputation: CanvasLayer = GameManager.get_node("Reputation")
@onready var HP: CanvasLayer = GameManager.get_node("Health")
@onready var Coins: CanvasLayer = GameManager.get_node("Coins")

func _on_start_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	Reputation.visible = true
	HP.visible = true
	Coins.visible = true
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_credits_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://Scenes/UI Elements/credits.tscn")

func _on_version_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("res://Scenes/UI Elements/version_notes.tscn")

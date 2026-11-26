extends Area2D

var quest: QuestManager

#@onready var dialogue_manager: CanvasLayer = %DialogueManager
#var dialogue: Array[String] = ["Oh hello.", "My husband?", "I guess I can go back to him.", "Lead the way."]

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
#		dialogue_manager.start_dialogue(dialogue);
		quest.reached_goal()
		queue_free()

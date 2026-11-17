extends Area2D

var quest: QuestManager

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		quest.reached_goal()
		queue_free()

extends Area2D

@export var quest: FetchQuest
var fruit := load("res://Scenes/Items/fruit.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if quest.quest_status == quest.QuestStatus.available:
			quest.start_quest()
			var new_fruit = fruit.instantiate()
			add_child(new_fruit)
			new_fruit.position = $FruitSpawnPoint.position
			new_fruit.quest = quest
		
		if quest.quest_status == quest.QuestStatus.reached_goal:
			quest.finish_quest()

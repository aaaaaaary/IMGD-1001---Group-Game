extends Area2D

@onready var timer: Timer = $Timer
@onready var rep_label: Label = $RepLabel
@export var quest: TimedQuest
var fruit := load("res://Scenes/Items/fruit.tscn")

func _ready() -> void:
	rep_label.text = str(quest.reputation_requirement)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if quest.quest_status == quest.QuestStatus.available:
			quest.start_quest()
			timer.start()
			var new_fruit = fruit.instantiate()
			add_child(new_fruit)
			new_fruit.position = $FruitSpawnPoint.position
			new_fruit.quest = quest
		
		if quest.quest_status == quest.QuestStatus.reached_goal:
			quest.finish_quest()



func _on_timer_timeout() -> void:
	timer.stop()
	quest.restart_quest()

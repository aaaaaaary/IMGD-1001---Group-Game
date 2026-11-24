extends Area2D

@export var quest: FetchQuest
@onready var rep_label: Label = $RepLabel
@onready var dialogue_manager: CanvasLayer = %DialogueManager
var fruit := load("res://Scenes/Items/fruit.tscn")

var dialogue_start: Array[String] = ["this is a big fat test", "blah blah blah blah blah"]

func _ready() -> void:
	rep_label.text = str(quest.reputation_requirement)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if Input.is_action_just_pressed("ui_accept"):
			dialogue_manager.start_dialogue(dialogue_start);
		if quest.quest_status == quest.QuestStatus.available:
			quest.start_quest()
			var new_fruit = fruit.instantiate()
			add_child(new_fruit)
			new_fruit.position = $FruitSpawnPoint.position
			new_fruit.quest = quest
		
		if quest.quest_status == quest.QuestStatus.reached_goal:
			quest.finish_quest()

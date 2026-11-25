extends Area2D

@export var quest: FetchQuest
@onready var rep_label: Label = $RepLabel
@onready var dialogue_manager: CanvasLayer = %DialogueManager
@onready var dialogue_choices: CanvasLayer = %DialogueChoices

var fruit := load("res://Scenes/Items/fruit.tscn")

var dialogue_start: Array[String] = ["this is a big fat test", "blah blah blah blah blah", "do you accept my quest?"]
var choices: Array[String] = ["yes yes yes! i would love to accept your beautiful quest!", "hell no! h-h-hellll no"]
var dialogue_accept: Array[String] = ["thank you thank you thank you thank you thank you thank you", "now go find my shit"]
var dialogue_decline: Array[String] = ["you stink", "go find someone else whose hopes and dreams you can crush"]
var dialogue_complete: Array[String] = ["thank you so much!", "i never thought i would see my [ITEM] ever again!"]

func _ready() -> void:
	rep_label.text = str(quest.reputation_requirement)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		
		if quest.quest_status == quest.QuestStatus.available:
				dialogue_manager.start_dialogue(dialogue_start);
				await dialogue_manager.get_node("DialogueBox").visibility_changed
				get_tree().paused = true;
				dialogue_choices.visible = true;
				dialogue_choices.set_choices(choices);
				
		if quest.quest_status == quest.QuestStatus.reached_goal:
			dialogue_manager.start_dialogue(dialogue_complete)
			quest.finish_quest()




func _on_dialogue_choices_selected(index: Variant) -> void:
	if(index == 0):
		dialogue_manager.start_dialogue(dialogue_accept);
		await dialogue_manager.get_node("DialogueBox").visibility_changed
		quest.start_quest()
		var new_fruit = fruit.instantiate()
		add_child(new_fruit)
		new_fruit.position = $FruitSpawnPoint.position
		new_fruit.quest = quest
	if(index == 1):
		dialogue_manager.start_dialogue(dialogue_decline);

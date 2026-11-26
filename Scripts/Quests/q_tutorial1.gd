extends Area2D

@export var quest: FetchQuest
@onready var rep_label: Label = $RepLabel
@onready var dialogue_manager: CanvasLayer = %DialogueManager
@onready var dialogue_choices: CanvasLayer = $DialogueChoices

var wife := load("res://Scenes/Items/sign_wife.tscn")

var dialogue_start: Array[String] = ["You notice an oddly colored sign.\nWhen you look closer to read its contents, you notice a face.", "Hey! Quit looking at me! Stop staring into my ravishing eyes! I'm taken!", "I'll tell my wife if you don't leave me alone!", "Actually..", "I haven't seen her in a bit. She must be trapped or lost.", "Oh please help me find her.", "PLEASE PLEASE PLEASE PLEASE PLEASE"]
var choices: Array[String] = ["Accept the sign's quest.", "Decline the quest."]

var dialogue_accept: Array[String] = ["Thanks. She should be around here somewhere. Maybe in the next section of the cave.", "Bring her back to me when you find her, 'kay?"]
var dialogue_decline: Array[String] = ["Aw that's too bad.", "It's a shame really.", "I guess nobody will trust you and you won't be able to complete the game.", "Huh?", "Game? What game? Did I say game?", "You're going to find my wife anyway.", "Bring her back to me when you find her."]

var dialogue_complete: Array[String] = ["Oh my sweet snickerdoodle snookums! Come here.", "Thanks for finding her.", "I'll put in the good word for you. I'm sure the others have got some stuff they need help with.", "And sorry for making you come all the way back to the start. But hey! Now you get to do it all over again."]

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
			dialogue_manager.start_dialogue(dialogue_complete);
			quest.finish_quest()




func _on_dialogue_choices_selected(index: Variant) -> void:
	
	if(index == 0):
		dialogue_manager.start_dialogue(dialogue_accept);
		await dialogue_manager.get_node("DialogueBox").visibility_changed
		quest.start_quest()
		var new_wife = wife.instantiate()
		add_child(new_wife)
		new_wife.position = $WifeSpawnPoint.position
		new_wife.quest = quest
	if(index == 1):
		dialogue_manager.start_dialogue(dialogue_decline);
		await dialogue_manager.get_node("DialogueBox").visibility_changed
		quest.start_quest()
		var new_wife = wife.instantiate()
		add_child(new_wife)
		new_wife.position = $WifeSpawnPoint.position
		new_wife.quest = quest

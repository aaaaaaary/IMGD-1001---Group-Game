class_name FetchQuest extends QuestManager
@onready var game_manager: Node = %GameManager


func start_quest() -> void:
	if get_tree().get_node_count_in_group("CurrentQuest") == 0:
		if GameState.reputation >= reputation_requirement:
			if quest_status == QuestStatus.available:
				quest_status = QuestStatus.started
				add_to_group("CurrentQuest")
				
				QuestBox.visible = true
				QuestTitle.text = quest_name
				QuestDescription.text = quest_description


func reached_goal() -> void:
	if quest_status == QuestStatus.started:
		quest_status = QuestStatus.reached_goal
		QuestDescription.text = reached_goal_text


func finish_quest() -> void:
	if quest_status == QuestStatus.reached_goal:
		quest_status = QuestStatus.finished
		remove_from_group("CurrentQuest")
		
		QuestBox.visible = false
		game_manager.update_reputation(reputation)

class_name TimedQuest extends QuestManager

# @onready var timer: Timer = $Timer

func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		
		QuestBox.visible = true
		QuestTitle.text = quest_name
		QuestDescription.text = quest_description
		# timer.start()

# func restart_quest() -> void:


func reached_goal() -> void:
	if quest_status == QuestStatus.started:
		quest_status = QuestStatus.reached_goal
		QuestDescription.text = reached_goal_text


func finish_quest() -> void:
	if quest_status == QuestStatus.reached_goal:
		quest_status = QuestStatus.finished
		
		QuestBox.visible = false
		GameManager.reputation += reputation

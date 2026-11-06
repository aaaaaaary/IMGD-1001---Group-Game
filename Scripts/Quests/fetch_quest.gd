class_name FetchQuest extends QuestManager

func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started #update quest status
		
		#update ui
		

#mark goal as reach
func reached_goal() -> void:
	if quest_status == QuestStatus.started:
		quest_status = QuestStatus.reached_goal #update quest status
		
		#update ui

#finish the quest
func finished_quest() -> void:
	if quest_status == QuestStatus.reached_goal:
		quest_status == QuestStatus.finished
		
		#hide quest ui
		
		#reward player
		#GameManager.reputaion += reputation_amount

class_name QuestManager extends Node


#define ui elements
	#added once keira finishes ui stuff

@export_group("Quest Settings")
@export var quest_name: String #name of quest
@export var quest_description: String #ui description of text
@export var reached_goal_text: String #ui description text after reaching goal ("Return to [NPC name]")

#all quest statuses
enum QuestStatus{
	available,
	started,
	reached_goal,
	finished,
}

#quest status
@export var quest_status: QuestStatus = QuestStatus.available

@export_group("Reward Settings")
@export var reputation_amount: int #amount of reputation rewarded (or lost?)

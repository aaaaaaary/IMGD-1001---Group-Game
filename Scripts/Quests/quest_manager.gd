class_name QuestManager extends Node2D


@onready var QuestBox: Panel = %HUD/Quest
@onready var QuestTitle: Label = %HUD/Quest/QuestTitle
@onready var QuestDescription: Label = %HUD/Quest/QuestDescription

#@onready var QuestTitle: Label = GameManager.get_node("Quest/QuestTitle")
#@onready var QuestDescription: Label = GameManager.get_node("Quest/QuestDescription")
#@onready var QuestBox: CanvasLayer = GameManager.get_node("Quest")

@export_group("Quest Settings")
@export var quest_name: String
@export var quest_description: String
@export var reached_goal_text: String
@export var reputation_requirement: int

enum QuestStatus{
	available,
	started,
	reached_goal,
	finished,
}

@export var quest_status: QuestStatus = QuestStatus.available

@export_group("Reward Settings")
@export var reputation: int

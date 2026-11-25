extends Node

@onready var reputation: Label = $"../HUD/Stats/Reputation"
@onready var health: Label = $"../HUD/Stats/Health"
@onready var player: CharacterBody2D = $"../Player"

func _ready():
	reputation.text = str(GameState.reputation)
	health.text = str(player.get_node("Health").get_max_health())

func update_reputation(value: int):
	GameState.reputation += value
	reputation.text = str(GameState.reputation)

func update_health(current_health: int):
	health.text = str(current_health)

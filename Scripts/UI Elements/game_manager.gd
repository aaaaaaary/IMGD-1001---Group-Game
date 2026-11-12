extends Node
@onready var score_label: Label = $ScoreLabel

var score = 0
var reputation = 0

#func _process(delta: float) -> void:
#	$CanvasLayer/Reputation.reputation = "Reputaion: " + str(reputation)
#	$CanvasLayer/Coins.coins = "Coins: " + str(score)

func add_point():
	score += 1;
	score_label.text = "You collected " + str(score) + " coins."

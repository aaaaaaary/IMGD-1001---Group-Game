extends CanvasLayer
signal SELECTED(index)


@onready var choices_list: VBoxContainer = $ChoicesBox/MarginContainer/Choices
@onready var button: Button = $ChoicesBox/MarginContainer/Choices/Button

var choices: Array[String] = []

func set_choices(value: Array[String]):
	choices = value
	initButtons()

func _ready():
	choices_list.get_child(0).pressed.connect(onChoice.bind(0))


func initButtons():
	var button
	
	while choices_list.get_child_count() > 1:
		button = choices_list.get_child(choices_list.get_child_count()-1)
		choices_list.remove_child(button)
		button.queue_free()
	
	for choice_index in range(choices.size()):
		if(choice_index == 0):
			choices_list.get_child(0).text = choices[choice_index]
		else:
			choices_list.add_child(button.duplicate())
			choices_list.get_child(choice_index).text = choices[choice_index]
			choices_list.get_child(choice_index).pressed.connect(onChoice.bind(choice_index))


func onChoice(choice_index):
	visible = false
	SELECTED.emit(choice_index)

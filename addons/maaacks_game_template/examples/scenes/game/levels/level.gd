extends Node

@warning_ignore("unused_signal")
signal level_lost
@warning_ignore("unused_signal")
signal level_won(level_path : String)
@warning_ignore("unused_signal")
signal level_changed(level_path : String)

## Optional path to the next level if using an open world level system.
@export_file("*.tscn") var next_level_path : String

func open_tutorials() -> void:
	%TutorialManager.open_tutorials()

func _ready() -> void:
	open_tutorials()

func _on_tutorial_button_pressed() -> void:
	open_tutorials()

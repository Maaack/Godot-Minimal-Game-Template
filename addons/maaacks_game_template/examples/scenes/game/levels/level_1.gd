extends "level.gd"

func _on_lose_button_pressed() -> void:
	level_lost.emit()

func _on_win_button_pressed() -> void:
	level_won.emit(next_level_path)

func _ready() -> void:
	super._ready()

func _on_color_picker_button_color_changed(color : Color) -> void:
	%BackgroundColor.color = color

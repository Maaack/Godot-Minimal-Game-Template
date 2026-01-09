extends RichTextLabel
## If true, disable opening links. For platforms that don't permit linking to other domains.
@export var disable_opening_links: bool = false

func _on_meta_clicked(meta: String) -> void:
	if meta.begins_with("https://") and not disable_opening_links:
		var _err = OS.shell_open(meta)

func _ready() -> void:
	meta_clicked.connect(_on_meta_clicked)

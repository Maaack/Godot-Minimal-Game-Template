@tool
class_name PluginUpdater
extends EditorPlugin

const PROJECT_SETTINGS_PATH = "plugin_updater/plugins"
const WINDOW_OPEN_DELAY : float = 0.5

const APIClient = preload("utilities/api_client.gd")
const DownloadAndExtract = preload("utilities/download_and_extract.gd")
const CheckPluginVersion = preload("updater/check_plugin_version.gd")
const UpdatePlugin = preload("updater/update_plugin.gd")

var _check_plugin_version_scene = preload("updater/check_plugin_version.tscn")
var _update_plugin_scene = preload("updater/update_plugin.tscn")
var added_menu_item : bool = false
var popup_menu : PopupMenu

static func get_plugin_repos() -> Dictionary:
	return ProjectSettings.get_setting(PROJECT_SETTINGS_PATH, {})

static func add_plugin(plugin_directory:String, plugin_repo_url:String):
	var plugin_repos := get_plugin_repos()
	plugin_repos[plugin_directory] = plugin_repo_url
	ProjectSettings.set_setting(PROJECT_SETTINGS_PATH, plugin_repos)

static func remove_plugin(plugin_directory:String):
	var plugin_repos := get_plugin_repos()
	plugin_repos.erase(plugin_directory)
	ProjectSettings.set_setting(PROJECT_SETTINGS_PATH, plugin_repos)

func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir()

func _on_visibility_changed_to_hidden(dialog_window : Window) -> void:
	if dialog_window and dialog_window.is_inside_tree() and not dialog_window.visible:
		dialog_window.queue_free()

func _delayed_call_with_path(callable : Callable, target_path : String) -> void:
	var timer: Timer = Timer.new()
	var timer_callable := func():
		timer.stop()
		callable.call(target_path)
		timer.queue_free()
	timer.timeout.connect(timer_callable)
	add_child(timer)
	timer.start(WINDOW_OPEN_DELAY)

func _on_new_version_detected(new_plugin_version:String, check_version_instance:CheckPluginVersion) -> void:
	_add_update_plugin_tool_option(check_version_instance.get_plugin_name(), new_plugin_version, check_version_instance.plugin_directory, check_version_instance.plugin_repo_url)

func _open_check_plugin_version() -> void:
	var plugin_repos = get_plugin_repos()
	if plugin_repos.is_empty():
		return
	var check_version_instance:CheckPluginVersion = _check_plugin_version_scene.instantiate()
	add_child.call_deferred(check_version_instance)
	await check_version_instance.ready
	check_version_instance.new_version_detected.connect(_on_new_version_detected.bind(check_version_instance))
	for plugin_directory in plugin_repos:
		check_version_instance.plugin_directory = plugin_directory
		check_version_instance.plugin_repo_url = plugin_repos[plugin_directory]
		check_version_instance.compare_versions()
		await check_version_instance.done
	check_version_instance.queue_free()

func open_update_plugin(plugin_directory:String, plugin_repo_url:String) -> void:
	var update_plugin_instance:UpdatePlugin = _update_plugin_scene.instantiate()
	add_child.call_deferred(update_plugin_instance)
	await update_plugin_instance.ready
	update_plugin_instance.update_completed.connect(_remove_update_plugin_tool_option)
	update_plugin_instance.plugin_directory = plugin_directory
	update_plugin_instance.plugin_repo_url = plugin_repo_url
	update_plugin_instance.get_latest_release()

func get_popup_menu() -> PopupMenu:
	if not popup_menu:
		popup_menu = PopupMenu.new()
	return popup_menu

func _on_id_pressed(_id : int, plugin_directory:String, plugin_repo_url:String):
	open_update_plugin(plugin_directory, plugin_repo_url)

func _add_update_plugin_tool_option(plugin_name:String, new_version:String, plugin_directory:String, plugin_repo_url:String) -> void:
	var _popup_menu := get_popup_menu()
	_popup_menu.add_item("%s to %s" % [plugin_name, new_version])
	if not _popup_menu.id_pressed.is_connected(_on_id_pressed):
		_popup_menu.id_pressed.connect(_on_id_pressed.bind(plugin_directory, plugin_repo_url))
	if not added_menu_item:
		add_tool_submenu_item("Update Plugins...", _popup_menu)
		added_menu_item = true

func _remove_update_plugin_tool_option() -> void:
	if not added_menu_item:
		return
	remove_tool_menu_item("Update Plugins...")

func _add_tool_options() -> void:
	_open_check_plugin_version()

func _remove_tool_options() -> void:
	_remove_update_plugin_tool_option()

func _enter_tree() -> void:
	add_plugin(get_plugin_path(), "https://github.com/Maaack/Godot-Plugin-Updater")
	_add_tool_options()

func _exit_tree() -> void:
	remove_plugin(get_plugin_path())
	_remove_tool_options()

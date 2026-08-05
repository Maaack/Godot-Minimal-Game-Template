# Godot Plugin Updater
Generic update wizard for plugins hosted on open source repositories. The plugin checks current plugin versions against lastest releases in the respective repos, and offers to update any that are out-of-date.

Supports plugins for Godot 4.4 through 4.7.1!

## Objective

Provide a generic solution for plugins hosted on open-source repositories to provide automatic updates through the editor.

Currently, only GitHub is supported, but other platforms are planned.


## Installation

### Godot Asset Store & Library

When editing a plugin:

1.  Go to the `Asset Store` tab.
2.  Search for "Plugin Updater".
3.  Click on the result to open the plugin details.
4.  Click to Download.
5.  Check that contents are getting installed to `addons/` and there are no conflicts.
6.  Click to Install.
7.  Reload the project (you may see errors before you do this).
8.  Enable the plugin from the Project Settings > Plugins tab.  

### GitHub


1.  Download the latest release version from [GitHub](https://github.com/Maaack/Godot-Plugin-Updater/releases/latest).  
2.  Extract the contents of the archive.
3.  Move the `addons/plugin_updater` folder into your project's `addons/` folder.  
4.  Open/Reload the project.  
5.  Enable the plugin from the Project Settings > Plugins tab.  


## Usage

Open the script of the plugin that you want to have automatic updates. This can be found in the plugin's configuration file (ex. `plugin.cfg`) under the `script` property (ex. `script="plugin.gd"`).

Add the following code:
```gdscript
func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir()

func _enter_tree() -> void:
    PluginUpdater.add_plugin(get_plugin_path(), "https://github.com/{USERNAME}/{REPO_NAME}}")

func _exit_tree() -> void:
	PluginUpdater.remove_plugin(get_plugin_path())
```

If you'd rather avoid including the Plugin Updater or making it a dependency, you can add the following code:

```gdscript
func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir()

func _enter_tree() -> void:
	var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
	plugin_repos[get_plugin_path()] = "https://github.com/{USERNAME}/{REPO_NAME}}"
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

func _exit_tree() -> void:
    var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
    plugin_repos.erase(get_plugin_path())
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

```

In either case, if the Plugin Updater is enabled in the user's project, then their editor will automatically check the 
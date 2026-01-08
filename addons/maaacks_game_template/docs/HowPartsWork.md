# How Parts Work

This page features snippets of extra documentation on key pieces of the plugin. It was previously included in the README.

- `scene_loader.tscn` is an autoloaded scene.  It can load scenes in the background or with a loading screen (`loading_screen.tscn` by default).   
- `opening.tscn` is a simple scene for fading in/out a few images at the start of the game. It then loads the next scene (`main_menu.tscn`).  
- `main_menu.tscn` is where a player can start the game, change settings, watch credits, or quit. It can link to the path of a game scene to play, and the packed scene of an options menu to use.  
- `option_control.tscn` and its inherited scenes are used for most configurable options in the menus. They work with `player_config.gd` to keep settings persistent between runs.
- The `PauseMenuController` can be set to load `pause_menu.tscn` when triggering `ui-cancel`.
- `pause_menu.tscn` is a type of `OverlaidMenu` with the `pauses_game` flag set to true. It will store the previously focused UI element, and return focus to it when closed.
- `capture_focus.gd` is attached to container nodes throughout the UI. It focuses onto UI elements when they are shown, allowing for easier navigation without a mouse.
- `game_ui.tscn` is a demo game scene that displays recognized action inputs, and features the `PauseMenuController` node, the `LevelLoader` node to load levels into a container, and `LevelManager` to manage level progress and show menus in case of a win or loss.
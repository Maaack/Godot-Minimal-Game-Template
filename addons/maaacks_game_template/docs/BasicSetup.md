# Basic Setup

These instructions cover the basics for setting up the template.

## Setup Wizard

The _Setup Wizard_ shows the user's progress through the setup process.

### Open

Open the _Setup Wizard_ by navigating to `Project > Tools > Run Maaack's Minimal Game Template Setup...`.

![Setup Wizard Location](/addons/maaacks_game_template/media/setup-wizard-location.png)

### Check & Complete

A typical full installation will have the following steps completed:  
-  Using Latest Version
-  Copy Example Files
-  Delete Example Files
-  Set Main Scene

![Setup Wizard Window](/addons/maaacks_game_template/media/setup-wizard-window.png)

Depending on how the template was installed, or if any issues occurred, some of these may need to be run from the wizard to be completed.

The remaining steps are optional customizations.

## Scene Paths

The flow of scenes in the template is (by default):  
```
Opening -> Main Menu -> Game Scene -> Ending Scene
```   

To change the _Main Menu_:

1.  Open `opening.tscn`.
2.  Select the `Opening` root node.
3.  Update `Next Scene Path` to the desired path (`main_menu_with_animations.tscn` by default).  
4.  Save the scene.

Other scenes that need updating:
- `pause_menu_layer.tscn`
- `game_ui.tscn` (`level_manager.gd`)  
- `end_credits.tscn`  

To change the _Game Scene_:

1.  Open `main_menu_with_animations.tscn`.
2.  Select the `MainMenu` root node.
3.  Update `Game Scene Path` to the path of the project's game scene (`game_ui.tscn` by default).  
4.  Save the scene.

To change the _Ending Scene_:

1.  Open `game_ui.tscn`.
2.  Select the `LevelManager` node.
3.  Expand the `Scenes` Option Group in the Inspector.
4.  Update the optional `Ending Scene Path` to the desired scene (`end_credits.tscn` by default).  
5.  Save the scene.

To change the _Opening_:

1.  Navigate to `Project > Project Settings…`
2.  In the _Project Settings_ window, go to the `General` tab.
3.  In the settings list, navigate to `Application > Run`.
4.  Update `Main Scene` to the desired path.

## Next Steps

### Recommended
1.  [Main Menu Setup](/addons/maaacks_game_template/docs/MainMenuSetup.md)  
2.  [Options Menu Setup](/addons/maaacks_game_template/docs/OptionsMenuSetup.md)  
3.  [Game Scene Setup](/addons/maaacks_game_template/docs/GameSceneSetup.md)  
4.  [Updating Credits](/addons/maaacks_game_template/docs/UpdatingCredits.md)  

### Extra
1.  [Adding Icons to the Input Options](/addons/maaacks_game_template/docs/InputIconMapping.md)  
2.  [Supporting Joypad Inputs](/addons/maaacks_game_template/docs/JoypadInputs.md)  
5.  [Uploading to itch.io](/addons/maaacks_game_template/docs/UploadingToItchIo.md)  
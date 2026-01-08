# Existing Project

These instructions assume starting with just the contents of `addons/` and going through the installer to copy the examples content into your project. This will be the case when installing the *plugin* version in the Godot Asset Library.

To revisit any part of the initial setup, find the `Setup Wizard` at `Project > Tools > Run Maaack's Minimal Game Template Setup...`. Example files can be re-copied from the `Setup Wizard`, assuming they have not been deleted.

1.  Update the project’s name in the main menu.
    

    1.  Open `main_menu_with_animations.tscn`.
    2.  Select the `TitleLabel` node.
    3.  The `Text` should match the project's name (in the project's settings).
        1. If `Text` is customized, set `Auto Update` to false.
    4.  Select the `SubtitleLabelNode` node and customize the `Text` as desired.
    5.  Save the scene.
    

2.  Link the main menu to a custom game scene (skip if using the example game scene).
    

    1.  Open `main_menu_with_animations.tscn`.
    2.  Select the `MainMenu` node.
    3.  Update `Game Scene Path` to the path of the project's game scene.
    4.  Save the scene.
    

3.  Add / remove configurable settings to / from menus.
    

    1.  Open `[master|mini|audio|visual|input]_options_menu.tscn` scenes to edit their options.
    2.  If an option is not desired, it can always be hidden, or removed entirely (sometimes with some additional work).
    3.  If a new option is desired, refer to [Adding Custom Options.](/addons/maaacks_game_template/docs/AddingCustomOptions.md)


4.  Update the game credits / attribution.
    

    1.  Open `credits_label.tscn`.
    2.  Update `CreditsLabel` with your desired text. BBCode allows for some formatting.
    3.  Save the scene.


5.  Continue with:

    1.  [Setting up the Main Menu.](/addons/maaacks_game_template/docs/MainMenuSetup.md)  
    2.  [Setting up a Game Scene.](/addons/maaacks_game_template/docs/GameSceneSetup.md)  
    3.  [Loading scenes asynchronously.](/addons/maaacks_game_template/docs/LoadingScenes.md)  
    4.  [Adding icons to the Input Options.](/addons/maaacks_game_template/docs/InputIconMapping.md)  
    5.  [Adding Custom Options.](/addons/maaacks_game_template/docs/AddingCustomOptions.md)

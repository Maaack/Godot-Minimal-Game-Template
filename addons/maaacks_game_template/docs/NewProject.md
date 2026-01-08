# New Projects

These instructions assume starting with the entire contents of the project folder. This will be the case when cloning the repo, or starting from the *template* version in the Godot Asset Library accessible from the Project Manager window.
  

1.  Finish setup.

    1.  Delete duplicate example files.
        1.  Go to `Project > Tools > Run Maaack's Minimal Game Template Setup...`.
        2.  In the `Setup Wizard` window next to "Delete Example Files", click `Run`.
        3.  In the next window, select `Yes` to continue with removing the example files.

    2.  Update autoload file paths.
        1.  Go to `Project > Tools > Run Maaack's Minimal Game Template Setup...`.
        2.  In the `Setup Wizard` window next to "Update Autoload Paths", click `Run`.

    3.  Set a default theme.
        1.  Go to `Project > Tools > Run Maaack's Minimal Game Template Setup...`.
        2.  In the `Setup Wizard` window next to "Set the Default Theme", click `Run`.
        3.  In the next window, select the desired theme from the preview and select `Yes` to set it as the project's default theme.

2.  Update the project’s name.


    1.  Go to `Project > Project Settings… > General > Application > Config`.
    2.  Update `Name` to `"Game Name"`.
    3.  Close the window.
    4.  Open `main_menu_with_animations.tscn`.
    5.  Select the `TitleLabel` node.
    6.  The `Text` should match the project's name.
        1. If `Text` is customized, set `Auto Update` to false.  
    7.  Select the `SubtitleLabelNode` node and customize the `Text` as desired.
    8.  Save the scene.


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

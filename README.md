# YetAnotherMenu

**Yet Another Menu is a plugin for Godot that automatically generates a fully customizable Pause Menu scene.**
## Features :
1. Displays a dedicated dock when the plugin is activated.
2. Customizable generation of a Pause Menu scene.
3. Ability to enable or disable various menu éléments :
   -	Volume option
   -	Game title
   -	Window mode
   -	Resolution
   -	Vertical synchronization
   -	“Back” button
   -	“Return to main menu” button
   -	“Quit game” button
   -	User-defined name for the generated scene (default : menu.tscn).
## Installation :
1.	Download or clone the plugin folder : yet_another_menu/
2.	Copy this folder into:
3.	`res://addons/yet_another_menu/`
4.	Open the project in Godot.
5.	Go to : Project → Project Settings → Plugins
6.	Activate the “Yet Another Menu” plugin.
Once the plugin is activated, a dock automatically appears in the editor, at the bottom right.
## Usage :
1.	Activate the “Yet Another Menu” plugin.
2.	In the dock, select the options to include in the scene :
 	-	Volume
	-	Title
 	- Window mode
	-	Resolution
	-	VSync
	-	Back button
	-	Return to main menu button
	-	Quit button
3.	Enter the name of the scene to generate.
- If no name is provided, the plugin uses “menu” by default.
- If a scene with the same name already exists in `res://`, it will be replaced.
4.	Click the “Generate Menu” button.
5.	The scene is automatically created in `res://` and can be opened or edited directly.
6.	To make the “main menu” button work, drag the ".tscn" scene you previously generated into the “Main Menu” field in the inspector.


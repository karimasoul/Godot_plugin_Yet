# YetAnotherMenu 

**Yet Another Menu is a plugin for Godot that automatically generates a fully customizable Pause Menu scene.**
<br>

## Features :
1. Displays a dedicated dock when the plugin is activated.
2. Customizable generation of a Pause Menu scene.
3. Ability to enable or disable various menu éléments :
   -	Volume option
   -	Game title
   -	Window mode
   -	Resolution -> Window resolution (not really useful in godot game, use at your own risk)
   -	Vertical synchronization
   -	“Back” button
   -	“Return to main menu” button
   -	“Quit game” button
   -	User-defined name for the generated scene (default : pause_menu.tscn).
<br>
<p align="center"><img width="431" height="264" alt="image" src="https://github.com/user-attachments/assets/4ffca0c2-3f13-4fa0-a487-654fbe272250" /></p>
<br>

## Installation :
1.	Download or clone the plugin folder : yet_another_menu/
2.	Copy this folder in addons into: `res://addons` in your own project
4.	Open the project in Godot.
5.	Go to : Project → Project Settings → Plugins
6.	Activate the “Yet Another Menu” plugin.
Once the plugin is activated, a dock automatically appears in the editor, at the bottom right.
<br>
<p align="center"><img width="410" height="88" alt="image" src="https://github.com/user-attachments/assets/49a93528-9137-41e9-b5d8-93fc054b5322" /></p>
<p align="center"><img width="1170" height="136" alt="image" src="https://github.com/user-attachments/assets/b55a0c9a-43dd-4f70-9fc2-c8cebda9ab23" /></p>
<br>

## Usage :
1.	Activate the “Yet Another Menu” plugin.
2.	In the dock, select the options to include in the scene :
 	-	Volume
	-	Title (you can specify the title name)
 	-   Window mode
	-	Resolution 
	-	VSync
	-	Back button
	-	Return to main menu button
	-	Quit button
3.	Enter the name of the scene to generate.
- If no name is provided, the plugin uses “pause_menu” by default.
- If a scene with the same name already exists in `res://`, it will be replaced.
4.	Click the “Generate Menu” button.
5.	The scene is automatically created in `res://` and can be opened or edited directly.
6.	To make the “main menu” button work, drag the ".tscn" scene you previously generated into the “Main Menu” field in the inspector.

<br>

## License :
This plugin is licensed under the MIT License. See the LICENSE file for details.



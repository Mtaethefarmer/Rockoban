extends Node2D
################################################################################
#@file   Player.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called Player.
#
#		Operations include:
#        - Detect controller when a controller is connected/disconnected
#@par
#		Discussion:
#		 - [MONO C] Connecting controllers in Mono C# crashes the game.
#   	 - [MONO C] Input class has #.Singleton class added.
#        				"https://github.com/godotengine/godot/issues/24953"
#        				"https://github.com/godotengine/godot/pull/26071"S
#
################################################################################

################################################################################
#@class	Player
#@brief
#		The player class incharge of controlling each player
#
################################################################################
func _ready():
	#Listen for any controllers that connect to the game
	var err = Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	if(err):
		print(name + " encountered error code: " + String(err))

################################################################################
#@brief
#		Detects when a device is connected or disconnected
#@param[in]  device_id
#				Device index number
#@param[in] connected
#				[T: Device has been connected]
#				[F: Device has been removed]
#
################################################################################
func _on_joy_connection_changed(device_id, connected):

	#Detect if which device connects/disconnects
	if(connected):
		print("Controller " + String(device_id+1) + " is connected.")
		GlobalEvents.emit_signal("PlayerControllerConnected", device_id+1)
	else:
		print("Controller " + String(device_id+1) + " is disconnected.")
		GlobalEvents.emit_signal("PlayerControllerDisconneted", device_id+1)

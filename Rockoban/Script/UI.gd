extends Control
################################################################################
#@file   UI.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called UI.
#
#		Operations include:
#		 - Play an animation when controller is connected
#		 - Play an animation when controller is disconnected
#@par
#		Discussion:
#
#
################################################################################

################################################################################
#@class	UI
#@brief
#		User Interface used during gameplay
#
################################################################################
func _ready():
	#Listen for any controllers that connect to the game
	var err = GlobalEvents.connect("PlayerControllerConnected", self, "OnPlayerControllerConnected")
	if(err):
		print(name + " encountered error code: " + String(err))

	#Listen for any controllers that disconnect from the game
	err = GlobalEvents.connect("PlayerControllerDisconneted", self, "OnPlayerControllerDisconnected")
	if(err):
		print(name + " encountered error code: " + String(err))

################################################################################
#@brief
#		Play an animation when the controller is connected
#@param[in] id
#		Number of the controller plugged in
#
################################################################################
func OnPlayerControllerConnected(id):
	$ConnectedController.text = "Controller " + String(id) + " connected."
	$AnimationPlayer.play("ConnectedControllerRise")

################################################################################
#@brief
#		Play an animation when the controller is disconnected
#@param[in] id
#		Number of the controller plugged in
#
################################################################################
func OnPlayerControllerDisconnected(id):
	$ConnectedController.text = "Controller " + String(id) + " disconnected."
	$AnimationPlayer.play("ConnectedControllerFall")
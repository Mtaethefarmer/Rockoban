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

	err = GlobalEvents.connect("YouWin", self, "onYouWin")
	if(err):
		print(name + " encountered error code: " + String(err))

	err = GlobalEvents.connect("GoToMainMenu", self, "onGoToMainMenu")
	if(err):
		print(name + " encountered error code: " + String(err))

	err = GlobalEvents.connect("GoToLevel", self, "onGoToLevel")
	if(err):
		print(name + " encountered error code: " + String(err))

	err = GlobalEvents.connect("Pause", self, "onPause")
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

################################################################################
#@brief
#		Reveal the You Win Screen and update the status of the game
#
################################################################################
func onYouWin():
	$Panel.visible = true
	$Panel/Label.text = "You Win"
	$Panel/Label.set_anchors_and_margins_preset(Control.PRESET_CENTER)
	if not GlobalEvents.isWinner:
		GlobalEvents.isWinner = true
		$AnimationPlayer.play("FadeIn")

################################################################################
#@brief
#		Reveal the Main Menu Screen
#
################################################################################
func onGoToMainMenu():
	$Panel/Label.text = " Rockoban "
	$Panel/Label.set_anchors_and_margins_preset(Control.PRESET_CENTER)

################################################################################
#@brief
#		Hide any unnessecary UI Elements when players are on a level
#
################################################################################
#warning-ignore:unused_argument
func onGoToLevel(level):
	if !GlobalEvents.isWinner:
		$Panel.hide()

################################################################################
#@brief
#		Show a pause menu when the game is paused
#
################################################################################
func onPause():
	if GlobalEvents.isPaused:
		$Panel.hide()
		GlobalEvents.isPaused = false;
		print("Un-Paused the game.")
	else:
		$Panel.self_modulate = Color(1,1,1,0.5)
		$Panel.show()
		$Panel/Label.text = " Paused "
		$Panel/Label.set_anchors_and_margins_preset(Control.PRESET_CENTER_TOP)
		GlobalEvents.isPaused = true;
		print("Paused the game.")
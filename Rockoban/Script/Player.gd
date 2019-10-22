extends "Pawn.gd"
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
enum PlayerID{ONE = 1, TWO};
export(PlayerID) var Id = 1;
var direction
var animationName = "walk_down"
#var audioName = "res://Asset/Audio/UI/click2.ogg"
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

#warning-ignore:unused_argument
func _input(event):
	var d = GetInput(event)

	if not d:
		return

	var newPosition = get_parent().RequestMove(self, d)

	if newPosition && newPosition != position:
		set_process(false)
#		if(Id == PlayerID.ONE):
#			audioName = "res://Asset/Audio/UI/click1.ogg"
#		$AudioStreamPlayer.stream = audioName
		$AudioStreamPlayer.play()
		$AnimationPlayer.play(animationName)
		$Tween.interpolate_property(self, "Sprite.position", -direction * 32, Vector2(), $AnimationPlayer.current_animation_length,Tween.TRANS_LINEAR,Tween.EASE_IN)
		$Tween.start()
		position = newPosition

		yield($AnimationPlayer, "animation_finished")
		set_process(true)
	else:
		$AnimationPlayer.play("bump")

#func _input(event):
#	if event is InputEventJoypadButton:
#		print(event.button_index)

################################################################################
#@brief
#		Determines which direction Player One will move based on contoller
#		input
################################################################################
func GetInput(event):

	#Movement
	direction = Vector2()
	if Id == PlayerID.ONE:
		if event.is_action_pressed("PlayerOneMoveLeft"):
			direction += Vector2.LEFT
			animationName = "walk_left"
		elif event.is_action_pressed("PlayerOneMoveRight"):
			direction += Vector2.RIGHT
			animationName = "walk_right"
		elif event.is_action_pressed("PlayerOneMoveUp"):
			direction += Vector2.UP
			animationName = "walk_up"
		elif event.is_action_pressed("PlayerOneMoveDown"):
			direction += Vector2.DOWN
			animationName = "walk_down"

		#Pause from player one
		if event.is_action_released("Pause"):
			print("Player " + String(Id) + " has chosen the press pause")
			GlobalEvents.emit_signal("Pause")

	if Id == PlayerID.TWO:
		if event.is_action_pressed("PlayerTwoMoveLeft"):
			direction += Vector2.LEFT
			animationName = "walk_left"
		if event.is_action_pressed("PlayerTwoMoveRight"):
			direction += Vector2.RIGHT
			animationName = "walk_right"
		if event.is_action_pressed("PlayerTwoMoveUp"):
			direction += Vector2.UP
			animationName = "walk_up"
		if event.is_action_pressed("PlayerTwoMoveDown"):
			direction += Vector2.DOWN
			animationName = "walk_down"

	return direction

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

################################################################################
#@brief
#		Storing all player data in a dictionary
#@return
#		All player data as a dictionary
#
################################################################################
func Save():
	var name_ind1 = get_parent().get_node("Player1")
	var name_ind2 = get_parent().get_node("Player2")
	var color = "white"
	var save_data

	if Id == 1:
		color = "green"
		save_data = {
		"name": name_ind1.name,
		"path": filename,
		"type": -2,
		"X": get_parent().GetPawnCellPosition(name_ind1.position).x,
		"Y": get_parent().GetPawnCellPosition(name_ind1.position).y,
		"id": name_ind1.Id,
		"color": color
		}
	else:
		color = "orange"
		save_data = {
		"name": name_ind2.name,
		"path": filename,
		"type": -2,
		"X": get_parent().GetPawnCellPosition(name_ind2.position).x,
		"Y": get_parent().GetPawnCellPosition(name_ind2.position).y,
		"id": name_ind2.Id,
		"color": color
		}
	return save_data
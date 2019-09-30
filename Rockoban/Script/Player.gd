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
enum PlayerID{ONE, TWO};
export(PlayerID) var Id = 1;
var direction
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

func _process(delta):
	var d = GetInput()

	if not d:
		return

	var newPosition = get_parent().RequestMove(self, d)

	if newPosition && newPosition != position:
		set_process(false)
		$AnimationPlayer.play("walk")
		$Tween.interpolate_property(self, "icon.position", -direction * 32, Vector2(), $AnimationPlayer.current_animation_length,Tween.TRANS_LINEAR,Tween.EASE_IN)
		position = newPosition
		print(newPosition)
		$Tween.start()
		yield($AnimationPlayer, "animation_finished")
		set_process(true)
	else:
		$AnimationPlayer.play("bump")


################################################################################
#@brief
#		Determines which direction Player One will move based on contoller
#		input
################################################################################
func GetInput():
	#
	direction = Vector2()
	if Id == PlayerID.ONE:
		if Input.is_action_just_pressed("PlayerOneMoveLeft"):
			direction += Vector2.LEFT
		elif Input.is_action_just_pressed("PlayerOneMoveRight"):
			direction += Vector2.RIGHT
		elif Input.is_action_just_pressed("PlayerOneMoveUp"):
			direction += Vector2.UP
		elif Input.is_action_just_pressed("PlayerOneMoveDown"):
			direction += Vector2.DOWN
	if Id == PlayerID.TWO:
		if Input.is_action_pressed("PlayerTwoMoveLeft"):
			direction += Vector2.LEFT
		if Input.is_action_pressed("PlayerTwoMoveRight"):
			direction += Vector2.RIGHT
		if Input.is_action_pressed("PlayerTwoMoveUp"):
			direction += Vector2.UP
		if Input.is_action_pressed("PlayerTwoMoveDown"):
			direction += Vector2.DOWN
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

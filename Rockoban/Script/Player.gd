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
var p1velocity = Vector2() #Which direction the Player One is moving
var p2velocity = Vector2() #Which direction Player Two is moving
export(int) var Speed = 200 #How fast the player moves in pixels/sec
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

func _physics_process(delta):
	P1GetInput()
	P2GetInput()
	$P1KinematicBody2D.move_and_collide(p1velocity * delta)
	$P2KinematicBody2D.move_and_collide(p2velocity*delta)

################################################################################
#@brief
#		Determines which direction Player One will move based on contoller
#		input
################################################################################
func P1GetInput():
	#
	var direction = Vector2()
	if Input.is_action_pressed("PlayerOneMoveLeft"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("PlayerOneMoveRight"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("PlayerOneMoveUp"):
		direction += Vector2.UP
	if Input.is_action_pressed("PlayerOneMoveDown"):
		direction += Vector2.DOWN

	p1velocity = direction.normalized() * Speed

################################################################################
#@brief
#		Determines which direction Player Two will move based on contoller
#		input
################################################################################
func P2GetInput():
	var direction = Vector2()
	if Input.is_action_pressed("PlayerTwoMoveLeft"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("PlayerTwoMoveRight"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("PlayerTwoMoveUp"):
		direction += Vector2.UP
	if Input.is_action_pressed("PlayerTwoMoveDown"):
		direction += Vector2.DOWN

	p2velocity = direction.normalized() * Speed

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

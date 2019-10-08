extends Node

enum TileType{PLAYER = -2 , OPEN, WALL, CRATE, HOLE, CONTINUE, LEVEL_SELECT, QUIT, MAIN_MENU}

var Player1 = preload("res://Prefab/Player/Player.tscn")
var Player2 = preload("res://Prefab/Player/Player.tscn")
var ContinueTile = preload("res://Prefab/Object/ContinueTile.tscn")
var LevelSelectTile = preload("res://Prefab/Object/LevelSelectTile.tscn")
var MainMenuTile = preload("res://Prefab/Object/MainMenuTile.tscn")

func _ready():
	#Connect signals to the instance of the crate
	var err = GlobalEvents.connect("YouWin", self, "onYouWin")

	if(err):
		print(name + " encountered error code: " + String(err))

	AddPlayers()

func AddPlayers():
	var instance = Player1.instance()
	instance.name = "Player 1"
	instance.Type = TileType.PLAYER
	instance.Id = 1
	instance.z_index = 2
	instance.z_as_relative = false
	instance.modulate = ColorN("green")
	$Grid.AddPawn(instance, Vector2(1,1), $Grid.cell_size/2)
	instance = Player2.instance()
	instance.name = "Player 2"
	instance.Type = TileType.PLAYER
	instance.Id = 2
	instance.z_index = 2
	instance.z_as_relative = false
	instance.modulate = ColorN("blue")
	$Grid.AddPawn(instance, Vector2(3,4), $Grid.cell_size/2)

func onYouWin():
	#Load the continue, level select and main menu buttons
	var instance = ContinueTile.instance()
	$Grid.AddPawn(instance, Vector2(6,5), Vector2(0, $Grid.cell_size.y/2))
	instance = LevelSelectTile.instance()
	$Grid.AddPawn(instance, Vector2(8,5), Vector2(0, $Grid.cell_size.y/2))
	instance = MainMenuTile.instance()
	$Grid.AddPawn(instance, Vector2(10, 5), Vector2(0, $Grid.cell_size.y/2))

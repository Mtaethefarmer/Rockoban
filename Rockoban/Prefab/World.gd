extends Node

var Player1 = preload("res://Prefab/Player/Player.tscn")
var Player2 = preload("res://Prefab/Player/Player.tscn")
var ContinueTile = preload("res://Prefab/Object/ContinueTile.tscn")
var LevelSelectTile = preload("res://Prefab/Object/LevelSelectTile.tscn")
var MainMenuTile = preload("res://Prefab/Object/MainMenuTile.tscn")
var StartTile = preload("res://Prefab/Object/StartTile.tscn")
func _ready():
	#Connect signals to the instance of the crate
	var err = GlobalEvents.connect("YouWin", self, "onYouWin")

	if(err):
		print(name + " encountered error code: " + String(err))

	err = GlobalEvents.connect("GoToMainMenu", self, "onGoToMainMenu")

	if(err):
		print(name + " encountered error code: " + String(err))

	err = GlobalEvents.connect("GoToLevel", self, "onGoToLevel")

	if(err):
		print(name + " encountered error code: " + String(err))

	onGoToLevel(0)

func AddPlayers():
	var instance = Player1.instance()
	instance.name = "Player 1"
	instance.Type = GlobalEvents.TileType.PLAYER
	instance.Id = 1
	instance.z_index = 2
	instance.z_as_relative = false
	instance.modulate = ColorN("green")
	$Grid.AddPawn(instance, Vector2(1,1), $Grid.cell_size/2)
	instance = Player2.instance()
	instance.name = "Player 2"
	instance.Type = GlobalEvents.TileType.PLAYER
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

func onGoToMainMenu():
	var instance = StartTile.instance()
	$Grid.AddPawn(instance, Vector2(6,5), Vector2(0, $Grid.cell_size.y/2))

func onGoToLevel(level):
	var tiles = $JSONParser.CreateLevelFromJSON("res://Prefab/Level/Level00" + String(level) + ".json")
	for tile in tiles:
		$Grid.AddPawn(tile, Vector2(tile.GridPosition.x, tile.GridPosition.y), $Grid.cell_size/2)
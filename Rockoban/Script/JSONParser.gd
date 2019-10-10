extends Node

func _ready():
	pass

func LoadJSON(json):
	var file = File.new()
	file.open(json, File.READ)
	var LevelJSON = parse_json(file.get_as_text())
	file.close()
	return LevelJSON

func CreateLevelFromJSON(filepath):
	var LevelJSON = LoadJSON(filepath)
	var TileArray = []
	for tile in LevelJSON:
		var instance = load(LevelJSON[tile]["path"]).instance()
		instance.position = Vector2.ZERO
		instance.name = LevelJSON[tile]["name"]
		instance.Type = LevelJSON[tile]["type"]
		instance.GridPosition.x = LevelJSON[tile]["X"]
		instance.GridPosition.y = LevelJSON[tile]["Y"]
		TileArray.append(instance)
	return TileArray
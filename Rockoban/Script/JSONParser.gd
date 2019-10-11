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

		if LevelJSON[tile]["name"]:
			instance.name = LevelJSON[tile]["name"]

		if LevelJSON[tile]["type"]:
			instance.Type = LevelJSON[tile]["type"]

		if LevelJSON[tile]["X"] && LevelJSON[tile]["Y"]:
			instance.GridPosition.x = LevelJSON[tile]["X"]
			instance.GridPosition.y = LevelJSON[tile]["Y"]

		if LevelJSON[tile].has("id"):
			instance.Id = LevelJSON[tile]["id"]

		if LevelJSON[tile].has("color"):
			instance.modulate = ColorN(LevelJSON[tile]["color"])
		TileArray.append(instance)
	return TileArray
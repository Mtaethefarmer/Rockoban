extends Node
################################################################################
#@file   JSONParser.gd
#@author Devone Reynolds
#@brief
#        This is the implementation file for all member functions
#        of a class called JSONParser.
#
#		Operations include:
#        - Loading a JSON file into a Dictionary
#@par
#		Discussion:
#
################################################################################

################################################################################
#@class	JSONParser
#@brief
#		Tool used for reading and parsing JSON files
#
################################################################################
func _ready():
	pass

################################################################################
#@brief
#		Reading and parsing JSON files into Nodes
#@param json
#			Filepath for the json file to be read
#@return
#		Contents of json file as a Dictionary
#
################################################################################
func LoadJSON(json):
	var file = File.new()
	var LevelJSON
	if file.file_exists(json):
		file.open(json, File.READ)
		LevelJSON = parse_json(file.get_as_text())
		if typeof(LevelJSON) != TYPE_DICTIONARY or LevelJSON.empty():
			print("Unable to read JSON file: " + json)
			print("JSON: " + json + " was empty or not in dictionary format.")
		file.close()
	else:
		print("Unable to read JSON file: " + json)
		print("JSON: "+ json + " does not exist.")
	return LevelJSON

################################################################################
#@brief
#		Saving Nodes into a JSON file
#@param level
#			Container of nodes to be saved
#
################################################################################
func SaveJSON(level):
	var file = File.new()
	file.open("res://Resource/SaveData.json", File.WRITE)
	var data = {}
	for tile in level:
		data[tile.name] = tile.call("Save")
	file.store_line(to_json(data))
	file.close()

################################################################################
#@brief
#		Uses the information from a JSON file to create objects for a level
#@param filepath
#			Filepath for the JSON file to be read
#@return
#		An array of nodes to be instanced into the level
#
################################################################################
func CreateLevelFromJSON(filepath):
	var LevelJSON = LoadJSON(filepath)

	if typeof(LevelJSON) != TYPE_DICTIONARY:
		return null

	var TileArray = []
	var instance
	for tile in LevelJSON:
		if LevelJSON[tile].has("level"):
			TileArray = CreateLevelFromJSON(LevelJSON[tile]["level"])

		if LevelJSON[tile].has("path"):
			instance = load(LevelJSON[tile]["path"]).instance()
			instance.position = Vector2.ZERO

		if LevelJSON[tile].has("name"):
			instance.name = LevelJSON[tile]["name"]

		if LevelJSON[tile].has("type"):
			instance.Type = LevelJSON[tile]["type"]

		if LevelJSON[tile].has("X") && LevelJSON[tile].has("Y"):
			instance.GridPosition.x = LevelJSON[tile]["X"]
			instance.GridPosition.y = LevelJSON[tile]["Y"]

		if LevelJSON[tile].has("id"):
			instance.Id = LevelJSON[tile]["id"]

		if LevelJSON[tile].has("color"):
			instance.modulate = ColorN(LevelJSON[tile]["color"])

		if LevelJSON[tile].has("offsetX"):
			instance.Offset.x += LevelJSON[tile]["offsetX"]
		else:
			if instance:
				instance.Offset.x += 32

		if LevelJSON[tile].has("offsetY"):
			instance.Offset.y += LevelJSON[tile]["offsetY"]
		else:
			if instance:
				instance.Offset.y += 32
		if instance:
			TileArray.append(instance)
	return TileArray
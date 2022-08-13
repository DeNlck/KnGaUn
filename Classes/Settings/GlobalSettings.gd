var bg_music
var settings_file = "res://settings.json"
var settings = {}
var from_base = "test123"
var default_settings = {
	"options":
		{
			"music_volume": -12,
			"music_enable": true
		}
}

const CHILD_PROPERTY_NAMING = "Child"



func set_property(property):
	print(property["name"], self.get(property["name"]))




func _init():
	pass
	

func load_settings():
	var file = File.new()
	if not file.file_exists(settings_file):
		reset_settings()
		return
	file.open(settings_file, file.READ)
	var text = file.get_as_text()
	settings = parse_json(text)
	file.close()
	
	
func reset_settings():
	settings = default_settings.duplicate(true)
	

func set_settings(music_volume, music_enable):
	settings["options"]["music_volume"] = music_volume
	settings["options"]["music_enable"] = music_enable


func save_settings():
	var file
	file = File.new()
	file.open(settings_file, File.WRITE)
	file.store_line(to_json(settings))
	file.close()
	

func merge_dict(dest, source):
	for key in source:                     # go via all keys in source
		if dest.has(key):                  # we found matching key in dest
			var dest_value = dest[key]     # get value 
			var source_value = source[key] # get value in the source dict           
			if typeof(dest_value) == TYPE_DICTIONARY:       
				if typeof(source_value) == TYPE_DICTIONARY: 
					merge_dict(dest_value, source_value)  
				else:
					dest[key] = source_value # override the dest value
			else:
				dest[key] = source_value     # add to dictionary 
		else:
			dest[key] = source[key]          # just add value to the dest
	return dest
	
	
func collect_child_properties():
	var properties_to_export = {}
	var properties = self.get_property_list()
	for property in properties:
		if CHILD_PROPERTY_NAMING in property["name"]:
			merge_dict(properties_to_export, {property["name"] : self.get(property["name"])})
#	print(properties_to_export)
	return properties_to_export
	

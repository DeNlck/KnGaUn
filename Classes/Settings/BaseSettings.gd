const CHILD_PROPERTY_NAMING = "Child"


func set_property(property, value):
	var temp = self.get(property)
	temp["actual"] = value
	self.set(property, temp)
	
func get_property(property, type = 'actual'):
	var item = self.get(property)
	if item != null:
		return item[type]
	else:
		return null



func _init():
	pass
	

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
	
	
func collect_child_properties(type = "actual"):
	var properties_to_export = {}
	var properties = self.get_property_list()
	for property in properties:
		if CHILD_PROPERTY_NAMING in property["name"]:
			merge_dict(properties_to_export, {property["name"] : self.get(property["name"])[type]})
	return properties_to_export
	
	
func update_properties(dest): #cейчас не используется но есть смысл его задействовать и будет красивый и лаконичный вызов
	merge_dict(dest, collect_child_properties())
	#также задуматься о передаче type = "actual"


func apply(type): #типа виртуальная функция, будем её полиморфить в потомках
	pass

extends Resource


class_name  Effect


@export var Name : String
@export_enum("Healing", "Damage","Buffing", "Move", ) var Type: String
@export_multiline var description: String
@export var Amount :int
var Target



func  WhenUsed():
	pass

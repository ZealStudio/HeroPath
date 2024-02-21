extends TextureRect

@export var Basetexture :Texture
@export var OnSelectedtexture :Texture


func Selected(bIsSelected):
	if  bIsSelected:
		texture = OnSelectedtexture
	else:
		texture = Basetexture

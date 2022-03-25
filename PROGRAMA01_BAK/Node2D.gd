extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.position = Vector2(300,500)
	$Sprite.scale.x = 0.3
	$Sprite.scale.y = 0.3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.scale.x *=0.99
	$Sprite.scale.y *=0.99
	$Sprite.move_local_x(4)
	if $Sprite.scale.x < 0.01:
		$Sprite.scale.x = 0.3
		$Sprite.scale.y = 0.3
		$Sprite.position = Vector2(300,500)

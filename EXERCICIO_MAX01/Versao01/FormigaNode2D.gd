extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var antes = Vector2(0,0)
var depois  = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()


func _on_ButtonMove_pressed():
	antes = $AntManSprite.position 
	$AntManSprite.move_local_x(10)
	depois = $AntManSprite.position 


func _draw():
	draw_line(antes,depois,Color(10.0,0.0,0.0))
	
	
func _on_ButtonSrink_pressed():
	$AntManSprite.scale.x *=0.9
	$AntManSprite.scale.y *=0.9
	
	

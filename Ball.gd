extends Area2D

export var _speed = 10
var _dir = Vector2(1, 1)

func _process(delta):
	position += _dir * _speed * delta
	if position.x >= get_viewport().size.x or position.x < 0:
		_dir.x *= -1
	if position.y >= get_viewport().size.y or position.y < 0:
		_dir.y *= -1




func _on_Ball_area_entered(area):
	print("Area entered!")

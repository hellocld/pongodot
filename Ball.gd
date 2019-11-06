extends KinematicBody2D

export var _speed = 10
var _dir = Vector2(1, 1)

func _ready():
	reset()


func _physics_process(delta):
	var collision = move_and_collide(_dir * _speed * delta)
	if collision:
		print(collision.collider.name)
		_dir = _dir.bounce(collision.normal)
	if position.x >= get_viewport().size.x or position.x < 0:
		_dir.x *= -1
	if position.y >= get_viewport().size.y or position.y < 0:
		_dir.y *= -1


func reset():
	_dir = _dir.normalized()
	position = get_viewport().size / 2
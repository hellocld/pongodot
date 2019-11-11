extends KinematicBody2D

export var _speed = 10
var _dir = Vector2(1, 1)
var _radius = 0


func _ready():
	reset()


func _physics_process(delta):
	var collision = move_and_collide(_dir * _speed * delta)
	if collision:
		print(collision.collider.name)
		_dir = _dir.bounce(collision.normal)
	if position.x >= get_viewport().size.x - _radius or position.x < _radius:
		_dir.x *= -1
	if position.y >= get_viewport().size.y - _radius or position.y < _radius:
		_dir.y *= -1


func reset():
	_dir = _dir.normalized()
	position = get_viewport().size / 2
	var shape = $CollisionShape2D.shape as CircleShape2D
	_radius = shape.radius
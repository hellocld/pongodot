extends KinematicBody2D

export var _speed = 10
var _dir = Vector2(1, 1)
var _radius = 0
var _hits = 0

func _physics_process(delta):
	var collision = move_and_collide(_dir * _speed * delta)
	if collision:
		$SFX.play()
		_hits += 1
		if _hits % 3 == 0:
			_speed += 10
		print(collision.collider.name)
		$AnimationPlayer.play("Boop")
		_dir = _dir.bounce(collision.normal)
	if position.x >= get_viewport().size.x - _radius or position.x < _radius:
		$SFX.play()
		_dir.x *= -1
	if position.y >= get_viewport().size.y - _radius or position.y < _radius:
		$SFX.play()
		_dir.y *= -1


func _ready():
	randomize()
	if(randf() > 0.5):
		_dir.x = 1
	else:
		_dir.x = -1
	if(randf() > 0.5):
		_dir.y = 1
	else:
		_dir.y = -1
	_dir = _dir.normalized()
	var shape = $CollisionShape2D.shape as CircleShape2D
	_radius = shape.radius
	_hits = 0
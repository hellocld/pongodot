extends KinematicBody2D

export var _speed = 32

func _physics_process(delta):
	var vec = Vector2(0, 0);
	if Input.is_action_pressed("ui_up"):
		vec.y = -1
	if Input.is_action_pressed("ui_down"):
		vec.y = 1
	move_and_collide(vec * _speed * delta)
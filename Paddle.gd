extends KinematicBody2D

export var _speed = 32

export (String, "p1", "p2") var _player = "p1"

var vec = Vector2(0, 0)

func _ready():
	print(_player + " ready!")

func _physics_process(delta):
	var vec = Vector2(0, 0);
	
	if Input.is_action_pressed(_player + "_up"):
		vec.y = -1
	if Input.is_action_pressed(_player + "_down"):
		vec.y = 1
	move_and_collide(vec * _speed * delta)
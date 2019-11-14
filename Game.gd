extends Node2D

export var game_score = 10

var p1_score = 0
var p2_score = 0

var ball = preload("res://Ball.tscn")

func _ready():
	p1_score = 0
	p2_score = 0
	_reset()

func _reset():
	$LabelPanel/Label.text = "GET READY"
	$LabelPanel.visible = true
	$Timer.connect("timeout", self, "_start_game")
	$Timer.one_shot = true
	$Timer.start(3)


func _start_game():
	print("Game start!")
	$LabelPanel.visible = false
	var t_ball = ball.instance()
	t_ball.position = get_viewport_rect().size / 2
	add_child(t_ball)


func _print_score():
	$HUD/Score.text = "%02d | %02d" % [p1_score, p2_score]
	print("P1 %d | P2 %d" % [p1_score, p2_score])


func _on_Goal_1_body_entered(area):
	if area == $Ball:
		$GoalSFX.play()
		$Ball.free()
		p2_score += 1
		_print_score()
		if p2_score >= game_score:
			print("P2 Wins!")
		else:
			_reset()


func _on_Goal_2_body_entered(area):
	if area == $Ball:
		$GoalSFX.play()
		$Ball.free()
		p1_score += 1
		_print_score()
		if p1_score >= game_score:
			print("P1 Wins!")
		else:
			_reset()